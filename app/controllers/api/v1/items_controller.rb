class Api::V1::ItemsController < ApplicationController
  before_action :authenticate_with_token!, only: [:index, :show]
  before_action :current_user_has_permission!, only: [:create, :update, :destroy]

  before_action :remove_all_fields, only: [:update]

  respond_to :json

  def index
    @items = current_user.company.items
    render
  end

  def show
    # need to capture exceptions since this returns null if the :id doesn't belong to the page
    @item = current_user.company.items.find_by(id: params[:id])
    render
  end

  def create
    @item = Item.new(item_params)
    @item.company_id = current_user.company_id
    @item.fields.build

    if @item.save
      render
    else
      render json: { errors: item.errors }, status: 422
    end
  end

  def update
    @item = current_user.company.items.find(params[:id])
    @item.fields.build

    if @item.update(item_params)
      render
    else
      render json: { errors: item.errors }, status: 422
    end
  end

  def destroy
    item = current_user.company.items.find(params[:id])
    item.destroy
    head 204
  end

  private
    def remove_all_fields
      @item = current_user.company.items.find(params[:id])

      @item.fields.delete_all
    end

    def item_params
      params.require(:item).permit(:title, :section_id, fields_attributes: [:field_template_attribute_id, :value])
    end
end
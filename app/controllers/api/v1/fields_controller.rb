class Api::V1::FieldsController < ApplicationController
  before_action :authenticate_with_token!, only: [:index, :show]
  before_action :current_user_has_permission!, only: [:create, :update, :destroy]

  respond_to :json

  def index
    respond_with current_user.company.fields
  end

  def show
  	# need to capture exceptions since this returns null if the :id doesn't belong to the page
    respond_with current_user.company.fields.find_by(id: params[:id])
  end

  def create
    field = Field.new(field_params)
    field.company_id = current_user.company_id

    field.created_at = Time.zone.parse('2000-00-00 21:00')

    if field.save
      render json: field, status: 201, location: [:api, field]
    else
      render json: { errors: field.errors }, status: 422
    end
  end

  def update
    field = current_user.company.fields.find(params[:id])

    if field.update(field_params)
      render json: field, status: 200, location: [:api, field]
    else
      render json: { errors: field.errors }, status: 422
    end
  end

  def destroy
    field = current_user.company.fields.find(params[:id])
    field.destroy
    head 204
  end

  private

    def field_params
      params.require(:field).permit(:item_id, :content)
    end
end

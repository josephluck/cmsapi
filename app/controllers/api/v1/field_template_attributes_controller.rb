class Api::V1::FieldTemplateAttributesController < ApplicationController
  before_action :authenticate_with_token!, only: [:index, :show]
  before_action :current_user_has_permission!, only: [:create, :update, :destroy]

  respond_to :json

  def index
    @field_template_attributes = current_user.company.field_template_attributes
    render
  end

  def show
    @field_template_attribute = current_user.company.field_template_attributes.find_by(id: params[:id])
    render
  end

  def create
    @field_template_attribute = FieldTemplateAttribute.new(field_template_attribute_params)
    @field_template_attribute.company_id = current_user.company_id

    if @field_template_attribute.save
      render
    else
      render json: { errors: @field_template_attribute.errors }, status: 422
    end
  end

  def update
    @field_template_attribute = current_user.company.field_template_attributes.find(params[:id])

    byebug

    if @field_template_attribute.update(field_template_attribute_params)
      render
    else
      render json: { errors: @field_template_attribute.errors }, status: 422
    end
  end

  def destroy
    field_template_attribute = current_user.company.field_template_attributes.find(params[:id])
    field_template_attribute.destroy
    head 204
  end

  private

    def field_template_attribute_params
      params.require(:field_template_attribute).permit(:name, :field_template_id, :kind, :options => [])
    end
end
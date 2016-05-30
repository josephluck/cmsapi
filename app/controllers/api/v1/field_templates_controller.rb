class Api::V1::FieldTemplatesController < ApplicationController
	before_action :authenticate_with_token!, only: [:index, :show]
	before_action :current_user_has_permission!, only: [:create, :update, :destroy]

	respond_to :json

	def index
	  @field_templates = current_user.company.field_templates.order(:order)
	  render
	end

	def show
		# need to capture exceptions since this returns null if the :id doesn't belong to the page
	  @field_template = current_user.company.field_templates.find_by(id: params[:id])
	  render
	end

	def create
	  @field_template = FieldTemplate.new(field_template_params)
	  @field_template.company_id = current_user.company_id
	  @field_template.order = current_user.company.field_templates.length + 1

	  if @field_template.save
	    render
	  else
	    render json: { errors: item.errors }, status: 422
	  end
	end

	def update
	  @field_template = current_user.company.field_templates.find(params[:id])

	  if @field_template.update(field_template_params)
	    render
	  else
	    render json: { errors: item.errors }, status: 422
	  end
	end

	def destroy
	  field_template = current_user.company.field_templates.find(params[:id])
	  field_template.destroy
	  head 204
	end

  # Reorder the sites
  def reorder
    params[:order].each do |value|
      FieldTemplate.find(value[:id]).update_attribute(:order,value[:order])
    end
    render :nothing => true
  end

	private
	  def field_template_params
	    params.require(:field_template).permit(:title)
	  end
end

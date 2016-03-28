class Api::V1::SectionsController < ApplicationController
  before_action :authenticate_with_token!, only: [:index, :show]
  before_action :current_user_has_permission!, only: [:create, :update, :destroy]

  respond_to :json

  def index
    @sections = current_user.company.sections
    render
  end

  def show
  	# need to capture exceptions since this returns null if the :id doesn't belong to the page
    @section = current_user.company.sections.find_by(id: params[:id])
    render
  end

  def create
    @section = Section.new(section_params)
    @section.company_id = current_user.company_id

    if @section.save
      render
    else
      render json: { errors: @section.errors }, status: 422
    end
  end

  def update
    @section = current_user.company.sections.find(params[:id])

    if @section.update(section_params)
      render
    else
      render json: { errors: @section.errors }, status: 422
    end
  end

  def destroy
    section = current_user.company.sections.find(params[:id])
    section.destroy
    head 204
  end

  # Return an array of sections for this page
  def items
    @items = current_user.company.sections.find_by(id: params[:section_id]).items()

    render
  end

  private

    def section_params
      params.require(:section).permit(:title, :page_id)
    end
end
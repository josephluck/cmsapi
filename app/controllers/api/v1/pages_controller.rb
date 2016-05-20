class Api::V1::PagesController < ApplicationController
  before_action :authenticate_with_token!, only: [:index, :show]
  before_action :current_user_has_permission!, only: [:create, :update, :destroy]

  respond_to :json

  def index
    @pages = current_user.company.pages.order(:order)
    render
  end

  def show
    @page = current_user.company.pages.find_by(id: params[:id])
    @sections = @page.sections.order(:order)

    render
  end

  def create
    @page = Page.new(page_params)
    @page.company_id = current_user.company_id
    site = current_user.company.sites.find(params[:site_id])

    if site
      @page.order = site.pages.length + 1
    end

    if @page.save
      render
    else
      render json: { errors: @page.errors }, status: 422
    end
  end

  def update
    @page = current_user.company.pages.find(params[:id])

    if @page.update(page_params)
      render
    else
      render json: { errors: @page.errors }, status: 422
    end
  end

  def destroy
    page = current_user.company.pages.find(params[:id])
    page.destroy
    head 204
  end

  # Reorder the sites
  def reorder
    params[:order].each do |value|
      Page.find(value[:id]).update_attribute(:order,value[:order])
    end
    render :nothing => true
  end

  # Return an array of sections for this page
  def sections
    @sections = current_user.company.pages.find_by(id: params[:page_id]).sections()
    render
  end

  private

    def page_params
      params.require(:page).permit(:title, :site_id)
    end
end
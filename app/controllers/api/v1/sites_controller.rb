class Api::V1::SitesController < ApplicationController
  before_action :authenticate_with_token!, only: [:index, :show]
  before_action :current_user_has_permission!, only: [:create, :update, :destroy]

  respond_to :json

  def index
    @sites = current_user.company.sites.order(:order)
    render
  end

  def show
    @site = current_user.company.sites.find_by(id: params[:id])
    render
  end

  def create
    @site = Site.new(site_params)
    @site.company_id = current_user.company_id
    @site.order = current_user.company.sites.length + 1

    if @site.save
      render
    else
      render json: { errors: @site.errors }, status: 422
    end
  end

  def update
    @site = current_user.company.sites.find(params[:id])

    if @site.update(site_params)
      render
    else
      render json: { errors: @site.errors }, status: 422
    end
  end

  def destroy
    site = current_user.company.sites.find(params[:id])
    site.destroy
    head 204
  end

  # Return an array of pages for this site
  def pages
    @pages = Site.find(params[:site_id]).pages
    render
  end

  # Reorder the sites
  def reorder
    params[:order].each do |value|
      Site.find(value[:id]).update_attribute(:order,value[:order])
    end
    render :nothing => true
  end

  private

    def site_params
      params.require(:site).permit(:title)
    end
end

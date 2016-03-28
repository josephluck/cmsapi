class Api::V1::SitesController < ApplicationController
  before_action :authenticate_with_token!, only: [:index, :show]
  before_action :current_user_has_permission!, only: [:create, :update, :destroy]

  respond_to :json

  def index
    respond_with current_user.company.sites
  end

  def show
    respond_with current_user.company.sites.find(params[:id])
  end

  def create
    site = Site.new(site_params)
    site.company_id = current_user.company_id

    if site.save
      render json: site, status: 201, location: [:api, site]
    else
      render json: { errors: site.errors }, status: 422
    end
  end

  def update
    site = current_user.company.sites.find(params[:id])

    if site.update(site_params)
      render json: site, status: 200, location: [:api, site]
    else
      render json: { errors: site.errors }, status: 422
    end
  end

  def destroy
    site = current_user.company.sites.find(params[:id])
    site.destroy
    head 204
  end

  # Return an array of pages for this site
  def pages
    pages = Site.find(params[:site_id]).pages()
    render json: { pages: pages }, status: 200
  end

  private

    def site_params
      params.require(:site).permit(:title)
    end
end

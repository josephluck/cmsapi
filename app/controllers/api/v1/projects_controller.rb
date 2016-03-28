class Api::V1::ProjectsController < ApplicationController
  before_action :authenticate_with_token!, only: [:index, :show]
  before_action :current_user_has_permission!, only: [:create, :update, :destroy]

  respond_to :json

  def index
    respond_with current_user.company.projects
  end

  def show
    respond_with current_user.company.projects.find(params[:id])
  end

  def create
    project = Project.new(project_params)
    project.company_id = current_user.company_id

    if project.save
      render json: project, status: 201, location: [:api, project]
    else
      render json: { errors: project.errors }, status: 422
    end
  end

  def update
    project = current_user.company.projects.find(params[:id])

    if project.update(project_params)
      render json: project, status: 200, location: [:api, project]
    else
      render json: { errors: project.errors }, status: 422
    end
  end

  def destroy
    project = current_user.company.projects.find(params[:id])
    project.destroy
    head 204
  end

  private

    def project_params
      params.require(:project).permit(:title)
    end
end
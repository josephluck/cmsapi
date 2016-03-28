class Api::V1::UserProjectsController < ApplicationController
  before_action :authenticate_with_token!, only: [:index, :show]
  before_action :current_user_has_permission!, only: [:create, :destroy]
  respond_to :json

  def index
    respond_with UserProject.all()
  end

  def show
    respond_with UserProject.find(params[:id])
  end

  def create
    user_project = UserProject.new(user_projects_params)

    if user_project.save
      render json: user_project, status: 201, location: [:api, user_project]
    else
      render json: { errors: user_project.errors }, status: 422
    end
  end

  def destroy
    # Check that both users belong to the same company to
    # prevent malicious users changing user id in requests.
    user = User.find(user_projects_params[:user_id])
    both_users_belong_to_same_company = user.company.id == current_user.company.id

    if both_users_belong_to_same_company
      user_project = UserProject.find_by_user_id_and_project_id(
                      user_projects_params[:user_id],
                      user_projects_params[:project_id])

      if user_project
        user_project.destroy
        head 204
      else
        render json: { errors: "Couldn't remove user from project" }, status: 422
      end
    else
      render json: { errors: "Both user's don't belong to same company" }, status: 422
    end
  end

  private

    def user_projects_params
      params.require(:user_project).permit(:user_id, :project_id)
    end
end
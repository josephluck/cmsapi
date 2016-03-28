class Api::V1::UsersController < ApplicationController
  before_action :current_user_has_permission!, only: [:index, :show, :create, :update, :destroy]

  respond_to :json

  def index
    @users = current_user.company.users
    render
  end

  def show
    @user = User.find(params[:id])
    render
  end

  # def create
  #   # Refactor this so that it does not rely on TeamMembers
  #   # we do not need team members...
  #   user = User.new(user_params)
  #   user.company_id = current_user.company_id
  #   user.company_name = current_user.company_name
  #   user.admin_user = true

  #   if user.save
  #     render json: user, status: 201, location: [:api, user]
  #   else
  #     render json: { errors: user.errors }, status: 422
  #   end
  # end

  def create
    @user = User.new(user_params)
    @user.company_id = current_user.company_id
    @user.company_name = current_user.company_name
    @user.admin_user = true

    if @user.save
      render
    else
      render json: { errors: @user.errors }, status: 422
    end
  end

  def update
    @user = current_user

    if @user.update(user_params)
      render
    else
      render json: { errors: @user.errors }, status: 422
    end
  end

  def destroy
    # Rework this such that the user can't delete the last admin user
    current_user.destroy
    head 204
  end

  private

    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
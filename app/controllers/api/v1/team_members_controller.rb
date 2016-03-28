# These are users an admin user has added that need to create an account.
# TODO when a user creates an account, remove them from TeamMembers.

class Api::V1::TeamMembersController < ApplicationController
	before_action :current_user_has_permission!, only: [:create, :update, :destroy]
  respond_to :json

  def index
    respond_with TeamMember.all()
  end

  def show
    respond_with TeamMember.find(params[:id])
  end

  def create
    team_member = TeamMember.new(team_member_params)
    team_member.company_id = current_user.company_id
    team_member.company_name = current_user.company_name

    if team_member.save
      render json: team_member, status: 201, location: [:api, team_member]
    else
      render json: { errors: team_member.errors }, status: 422
    end
  end

  private

    def team_member_params
      params.require(:team_member).permit(:email, :admin_user)
    end
end
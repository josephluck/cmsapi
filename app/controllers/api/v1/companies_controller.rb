class Api::V1::CompaniesController < ApplicationController
  respond_to :json

  def index
    respond_with Company.all()
  end

  def show
    @company = Company.find(params[:id])

    @api_consumer = @company.users.find_by(api_consumer: true)

    render
  end

  def create
    @company = Company.new(company_params)

    if @company.save
      # Create the first user
      @user = User.create(
        email: @company.email,
        password: @company.password,
        password_confirmation: @company.password,
        company_id: @company.id,
        company_name: @company.name,
        admin_user: true
      )

      # Create the API consumer key
      @api_consumer = User.create(
        email: SecureRandom.uuid + "@local.co",
        password: "12345678",
        password_confirmation: "12345678",
        company_id: @company.id,
        company_name: @company.name,
        api_consumer: true
      )

      render
    else
      render json: { errors: @company.errors }, status: 422
    end
  end

  def update
    # Only admin user can update company details
  end

  def destroy
    # Only admin user can delete company
  end

  # Protect with before_action
  def users
    users = Company.find(params[:id]).users()
    render json: { users: users }, status: 200
  end

  # Protect with before_action
  def projects
    projects = Company.find(params[:id]).projects()
    render json: { projects: projects }, status: 200
  end

  def pages
    @pages = Company.find(params[:id]).pages()
    render
  end

  private

    def company_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
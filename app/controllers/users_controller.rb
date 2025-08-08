class UsersController < ApplicationController
  # before_action :authenticate_request!, only: [:index]

  # POST /users
  def create
    user = User.new(user_params)
    if user.save
      render json: { user: user }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /users
  def index
    users = User.all
  
    render json: users.map { |user| user.as_json(only: [:id, :name, :email, :birthdate]) }
  end

  def show
    user = User.find(params[:id])
    if user
      render json: user.as_json(only: [:id, :name, :email, :birthdate])
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end

  def create_farm
    raw_body = request.raw_post
    render json: raw_body, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :birthdate, :password, :password_confirmation)
  end

  def farm_params
    params.require(:farm).permit(:name)
  end
end 
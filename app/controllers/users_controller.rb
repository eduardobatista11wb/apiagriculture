class UsersController < ApplicationController
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
    render json: users
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :birthdate, :password, :password_confirmation)
  end

  def farm_params
    params.require(:farm).permit(:name)
  end
end 
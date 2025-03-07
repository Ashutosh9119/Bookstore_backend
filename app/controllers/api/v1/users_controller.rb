class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:forgot_password, :reset_password]

  def signup
    result = UserService.signup(user_params)
    if result[:success]
      render json: { message: "User registered successfully", user: result[:user] }, status: :created
    else
      render json: { errors: result[:error] }, status: :unprocessable_entity
    end
  end

  private 

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :mobile_number)
  end
end

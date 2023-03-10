class LoginsController < ApplicationController

    before_action :fetch_user

    include JwtToken
  
    def create
      if @user&.authenticate(params[:password])
        @token = JwtToken.jwt_encode(@user.id)
        render json: {
          user: @user,
          token: @token,
          message: "LOGIN SUCCESSFULLY!"
        }, status: 201
      else
        render json: { message: "wrong password"}
      end
    end
  
    private
  
    def fetch_user
      @user = User.find_by_email(params[:email])
  
      render json: {
        message: "Email not registered!"
      } and return if @user.nil?
    end
  end
  

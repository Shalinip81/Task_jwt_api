class UsersController < ApplicationController
  include JwtToken
  before_action :validate_json_web_token ,only:[:show,:update,:destroy]
  # skip_before_action :validate_json_web_token, only: [:index, :create]


  def index
    @users=User.all
    render json: @users,status:200
  end

  def show
    byebug
    render json: @user,status:200
  end

  def create
    @user=User.new(user_params)
    if @user.save
      render json: @user ,status:201
    else
      render json: {erors:@user.errors.full_messages},status:503
    end
  end

  def destroy
    @user.destroy
    render json: @user ,status:201
  end

  def update
    decode = JwtToken.jwt_decode(params[:token])
    @user = User.find_by_id(decode)
    if @user.update(user_params)
      redirect_to users_path
    else
      redirect_to users_path
    end
  end

  private
  def user_params
    params.permit(:name,:email,:password)
  end

  def find_user
    @user=User.find(params[:id])
  end

end

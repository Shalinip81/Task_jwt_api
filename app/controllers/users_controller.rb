class UsersController < ApplicationController

  def index
    @users=User.all
    render json: @users,status:200
  end

  def show
    @user = User.find(params[:id])
    render json: @user,status:200
  end

  def new
    @user=User.new
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
    @user=User.find(params[:id])
    @user.destroy
    render json: @user ,status:201
  end


  def edit
    @user =User.find(params[:id])
    render :edit
  end


 def update
    @user = User.find(params[:id])
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

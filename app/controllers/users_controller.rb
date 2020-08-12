class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:new, :create]
  before_action :require_admin, only: [:index, :show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    redirect_to root_path if logged_in?

    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "User was created successfully"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User was updated succesfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil if @user === current_user
    flash[:notice] = "User #{params[:id]} was deleted succesfully"
    redirect_to users_path 
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

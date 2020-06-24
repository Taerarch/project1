class UsersController < ApplicationController
  before_action :check_for_login, :only => [:index]


  def index
    @users = User.all.order(:name)
    user = @current_user.id
    if @current_user.admin?

    end
  end

  def show
    @user = User.find params[:id]
    if @current_user.admin == true || @current_user.id == @user.id
      #just lets the method do what it would be normally.
    else
      redirect_to users_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    if @current_user.admin? || @current_user.id == user.id
      user.update user_params
    end
    redirect_to root_path
  end

  def destroy
    user = User.find params[:id]
    if @current_user.admin == true
      user.destroy
      redirect_to users_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

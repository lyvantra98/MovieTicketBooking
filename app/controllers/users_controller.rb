class UsersController < ApplicationController

  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :load_user, only: [:show, :edit, :update]

  def show
    return if @user

    flash[:danger] = t ".fail_show"
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t ".success_create"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit;end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = t ".flash_update"
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
                                 :password_confirmation, :phone, :gender,
                                 :birthday, :city
  end

  def logged_in_user
    return if logged_in?

    flash[:danger] = t ".flash_login"
    redirect_to login_url
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t ".flash_load_user"
    redirect_to root_path
  end
end

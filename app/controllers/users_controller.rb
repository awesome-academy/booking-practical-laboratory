class UsersController < ApplicationController
  before_action :correct_user, only: %i(edit update)
  before_action :find_user, only: %i(show destroy)

  def index
    @users = User.page(params[:page]).per Settings.page_limit
  end

  def new
    @user = User.new
  end

  def show
    return if @user.present?
    flash[:error] = t ".not"
    redirect_to signup_path
  end

  def create
    @user = User.new user_params

    if @user
      flash[:success] = t ".controller.find_success"
    else
      flash[:danger] = t ".controller.find_danger"
      redirect_to root_path
    end
  end

  def destroy
    if @user&.destroy
      flash[:success] = t ".controller.destroy_success"
    else
      flash[:danger] = t ".controller.destroy_danger"
    end
    redirect_to users_url
  end

  def edit; end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def find_user
    @user = User.find_by id: params[:id]
  end

  def correct_user
    find_user
    redirect_to root_url unless current_user? @user
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end

class UsersController < ApplicationController
  before_action :find_user, only: %i(show destroy)

  def index
    @users = User.page(params[:page]).per Settings.page_limit
  end

  def show
    return if @user.present?
    redirect_to users_path
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

  private

  def find_user
    if @user = User.find_by(id: params[:id])
      flash[:success] = t ".controller.find_success"
    else
      flash[:danger] = t ".controller.find_danger"
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user)
          .permit :name, :email, :password, :password_confirmation
  end
end

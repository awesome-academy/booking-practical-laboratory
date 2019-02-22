class UsersController < ApplicationController
  before_action :find_user, only: %i(show)

  def index
    @users = User.page(params[:page]).per Settings.page_limit
  end

  def show
    return if @user.present?
    flash[:error] = t ".not"
    redirect_to signup_path
  end

  private

  def find_user
    @user = User.find_by id: params[:id]

    if @user
      flash[:success] = t "success"
    else
      flash[:danger] = t "danger"
    end
  end

  def correct_user
    redirect_to root_url unless current_user? @user
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end

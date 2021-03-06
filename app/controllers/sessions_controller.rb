class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user&.authenticate(params[:session][:password])
      set_cookie_sessions user
    else
      flash.now[:danger] = t ".content_errousers"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def set_cookie_sessions user
    log_in user

    if params[:session][:remember_me] == Settings.one_remember
      remember user
    else
      forget user
    end
    redirect_to user
  end
end

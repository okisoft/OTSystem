class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    redirect_to root_path if logged_in?
  end

  def create
    user = User.find_by(user_id: params[:sessions][:user_id])
    if user && user.authenticate(params[:sessions][:password])
      log_in user
      flash[:success] = "ログインしました"
      if user.admin?
        redirect_to admin_path
      else
        redirect_to home_path
      end
    else
      flash.now[:danger] = 'パスワードかユーザIDが違います'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end

class SessionsController < ApplicationController
  def new
    # @TODO rootでリクエストがきた時の処理
  end

  def create
    user = User.find_by(user_id: params[:sessions][:user_id])
    if user && user.authenticate(params[:sessions][:password])
      log_in user
      flash[:success] = "ログインしました"
      # @TODO リダイレクト処理
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

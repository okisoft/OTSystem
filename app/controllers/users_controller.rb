class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.authority = 3
    if @user.save
      flash[:success] = "登録しました"
      log_in @user
      if @user.admin?
        redirect_to admin_path
      else
        redirect_to home_path
      end
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:user_id, :name, :password, :password_confirmation)
    end
end

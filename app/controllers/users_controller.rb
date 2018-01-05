class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.authority = 1
    if @user.save
      flash[:success] = "登録しました"
      # redirect_to login_path
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:user_id, :name, :password, :password_confirmation)
    end
end

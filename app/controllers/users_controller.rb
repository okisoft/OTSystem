class UsersController < ApplicationController
  before_action :correct_user,   only: [:edit, :update]
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

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      if @user.admin?
        redirect_to admin_path
      else
        redirect_to home_path
      end
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:user_id, :name, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
end

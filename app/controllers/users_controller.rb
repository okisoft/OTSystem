class UsersController < ApplicationController
  before_action :correct_user,   only: [:edit, :update]
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if !current_user.nil? && current_user.admin?
      @user = User.new(admin_params)
    else
      @user.authority = 3
    end
    if @user.save
      flash[:success] = "登録しました"
      if !current_user.nil? && current_user.admin?
        redirect_to admin_path
      else
        log_in @user
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
    update_params = user_params
    update_params = admin_params if @user.admin?
    if !@user.authenticate(params[:user][:current_password])
      @user.errors.add(:current_password, "is incorrect")
      render 'edit'
    elsif @user.update_attributes(update_params)
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

    def admin_params
      params.require(:user).permit(:user_id, :name, :authority, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
end

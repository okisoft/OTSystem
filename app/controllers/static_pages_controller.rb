class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: [:assign]

  def assign
    if !logged_in?
      redirect_to login_path
    elsif current_user.admin?
      redirect_to admin_path
    else
      redirect_to home_path
    end
  end

  def home
    render_404 if current_user.admin?
  end

  def admin
    render_404 unless current_user.admin?
  end
end

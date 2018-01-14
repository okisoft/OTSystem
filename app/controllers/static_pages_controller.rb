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
    public_lecture = PublicLecture.first
    render_not_open if public_lecture.lecture_time_id.nil?

    lecture_year = public_lecture.lecture_time.lecture_year
    if current_user.lecture_years.find_by(id: lecture_year.id).nil?
      redirect_to new_student_path
    end
  end

  def admin
    render_404 unless current_user.admin?

    @lectures = Lecture.all
  end
end

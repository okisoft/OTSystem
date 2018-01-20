class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: [:assign]
  @problems = []  # 初期化

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
    if current_user.admin?
      render_404
    else
      public_lecture = PublicLecture.first
      if public_lecture.lecture_time_id.nil?
        render_not_open
      else
        @lecture = Lecture.find_by(id: public_lecture.lecture_id)
        @public_lecture_time = @lecture.lecture_years.last.lecture_times.find_by(id: public_lecture.lecture_time_id)
        lecture_year = public_lecture.lecture_time.lecture_year
        if current_user.lecture_years.find_by(id: lecture_year.id).nil?
          redirect_to new_student_path
        end
      end
    end
  end

  def admin
    if !current_user.admin?
      render_404
    else
      @lectures = Lecture.all
    end
  end
end

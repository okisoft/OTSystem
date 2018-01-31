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
    if current_user.admin?
      render_404
    else
      public_lecture = PublicLecture.first
      if public_lecture.nil?
        render_not_open
      else
        @lecture = public_lecture.lecture
        lecture_time = public_lecture.lecture_time
        lecture_year = lecture_time.lecture_year
        @problems = lecture_time.problems

        @achievments = []
        @problems.each do |prb|
          @achievments << Achievment.find_or_create_by(
            user_id: current_user.id,
            problem_id: prb.id
          )
        end

        @progress = lecture_time.progresses.find_by(user_id: current_user.id)
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

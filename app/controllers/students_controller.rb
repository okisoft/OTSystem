class StudentsController < ApplicationController
  def new
  end

  def create
    if params[:students][:cerf] == "yes"
      public_lecture = PublicLecture.first
      Student.find_or_create_by(
        user_id: current_user.id,
        lecture_year_id: public_lecture.lecture_time.lecture_year.id
      )
      public_lecture.lecture_time.lecture_year.lecture_times.each do |lt|
        Progress.find_or_create_by(
          lecture_time_id: lt.id,
          user_id: current_user.id
        )
        lt.problems.each do |prb|
          Achievment.find_or_create_by(
            user_id: current_user.id,
            problem_id: prb.id,
            achieved: false
          )
        end
      end
      redirect_to home_path
    end
  end
end

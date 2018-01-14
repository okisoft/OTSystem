class StudentsController < ApplicationController
  def new
  end

  def create
    if params[:students][:cerf] == "yes"
      public_lecture = PublicLecture.first
      Student.create(
        user_id: current_user.id,
        lecture_year_id: public_lecture.lecture_time.lecture_year.id
      )
      redirect_to home_path
    end
  end
end

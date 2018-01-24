class LectureTimesController < ApplicationController
  def questions_index
    lecture_time = LectureTime.find(params[:id])
    @problems = lecture_time.problems.all
  end

  def progresses_index
    @lecture_time = LectureTime.find(params[:id])
    @users = @lecture_time.lecture_year.users
    @problems = @lecture_time.problems

    #publicの更新
    public_lecture = PublicLecture.all
    public_lecture.update(
      user_id: current_user.id,
      lecture_id: @lecture_time.lecture_year.lecture.id,
      lecture_time_id: @lecture_time.id
    )

  end

  def problems_index
    lecture_time = LectureTime.find(params[:id])
    @problems = lecture_time.problems.all
  end
end

class LectureTimesController < ApplicationController
  def questions_index
    lecture_time = LectureTime.find(params[:id])
    @problems = lecture_time.problems.all
  end

  def progresses_index
    @lecture_time = LectureTime.find(params[:id])
    @users = @lecture_time.lecture_year.users
    @problems = @lecture_time.problems
  end
end

class LectureTimesController < ApplicationController
  def questions_index
    lecture_time = LectureTime.find(params[:id])
    @problems = lecture_time.problems.all
  end

  def progresses_index
    lecture_time = LectureTime.find(params[:id])
    @progresses = lecture_time.progresses.all
    #binding.pry
    #@ahievments = @lecture_time.problems
  end
end

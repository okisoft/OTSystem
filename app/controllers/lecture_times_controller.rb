class LectureTimesController < ApplicationController
  def questions_index
    lecture_time = LectureTime.find(params[:id])
    @problems = lecture_time.problems.all
  end
end

class LectureYearsController < ApplicationController
  def times
    lecture_year = LectureYear.find(params[:id])
    @lecture_times = lecture_year.lecture_times
  end
end

class LecturesController < ApplicationController
  def years
    lecture = Lecture.find(params[:id])
    @lecture_years = lecture.lecture_years
  end

  def times
    @lecture = Lecture.find(params[:id])
    lecture_year = @lecture.lecture_years.last
    @lecture_times = lecture_year.lecture_times
  end
end

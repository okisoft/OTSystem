class LectureYearsController < ApplicationController
  def lecture_times_new
    @lecture_year = LectureYear.find(params[:id])
    @lecture_year.lecture_times.build
  end

  def lecture_times_create
    @lecture_year = LectureYear.find(params[:id])
    if @lecture_year.update_attributes(lecture_year_params)
      redirect_to times_lecture_year_path(@lecture_year)
    else
      render 'lecture_times_new'
    end
  end

  def lecture_times_index
    lecture_year = LectureYear.find(params[:id])
    @lecture_times = lecture_year.lecture_times
  end

  private

    def lecture_year_params
      params.require(:lecture_year).permit(:year, :style, lecture_times_attributes: [:title, :time, :_destroy])
    end
end

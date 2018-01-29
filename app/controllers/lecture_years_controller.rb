class LectureYearsController < ApplicationController
  def index
    lecture = Lecture.find(params[:lecture_id])
    @lecture_years = lecture.lecture_years.reverse
  end

  def edit
    lecture = Lecture.find(params[:id])
    @lecture_year = lecture.latest_year
    @lecture_year.lecture_times.build
  end

  def update
    @lecture_year = LectureYear.find(params[:id])
    if @lecture_year.update_attributes(lecture_year_params)
      @lecture_year.lecture_times.each_with_index do |lt, i|
        lt.update(time: i + 1)
      end
      flash[:succeess] = "登録しました"
      redirect_to lecture_year_lecture_times_path(@lecture_year)
    else
      flash[:danger] = "失敗しました"
      render 'edit'
    end
  end

  private

    def lecture_year_params
      params.require(:lecture_year).permit(:year, :style, lecture_times_attributes: [:id, :title, :problem_num, :_destroy])
    end
end

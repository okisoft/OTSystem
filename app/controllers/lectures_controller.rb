class LecturesController < ApplicationController
  def new
    @lecture = Lecture.new
    @lecture.lecture_years.build
  end

  def create
    @lecture = Lecture.new(lecture_params)
    if @lecture.save
      flash[:succeess] = "登録しました"
      redirect_to lecture
    else
      flash[:notice] = "失敗しました"
      render 'new'
    end	
  end

  def years
    lecture = Lecture.find(params[:id])
    @lecture_years = lecture.lecture_years
  end

  def times
    @lecture = Lecture.find(params[:id])
    lecture_year = @lecture.lecture_years.last
    @lecture_times = lecture_year.lecture_times
  end

  private

    def lecture_params
      params.require(:lecture).permit(:name, lecture_years_attributes: :style)
    end
end

class LecturesController < ApplicationController
  def new
    @lecture = Lecture.new
    @lecture.lecture_years.build
  end

  def create
    @lecture = Lecture.new(lecture_params)
    if @lecture.save
      flash[:succeess] = "登録しました"
      redirect_to new_times_lecture_year_path(@lecture.lecture_years.first)
    else
      flash[:danger] = "失敗しました"
      render 'new'
    end
  end

  def lecture_years_index
    lecture = Lecture.find(params[:id])
    @lecture_years = lecture.lecture_years
  end

  def lecture_times_index
    @lecture = Lecture.find(params[:id])
    lecture_year = @lecture.lecture_years.last # 最新年のデータを取得
    @lecture_times = lecture_year.lecture_times # 最新年の授業回を取得
  end

  private

    def lecture_params
      params.require(:lecture).permit(:name, lecture_years_attributes: [:style, :year])
    end
end

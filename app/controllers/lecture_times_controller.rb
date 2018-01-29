class LectureTimesController < ApplicationController

  def index
    @lecture_year = LectureYear.find(params[:lecture_year_id])
    @lecture_times = @lecture_year.lecture_times
  end

  def edit
    @lecture_time = LectureTime.find(params[:id])
  end

  def update
    @lecture_time = LectureTime.find(params[:id])
    if @lecture_time.update_attributes(lecture_time_params)
      flash[:succeess] = "登録しました"
      redirect_to lecture_year_lecture_times_path(@lecture_time.lecture_year)
    else
      flash[:danger] = "失敗しました"
      render 'edit'
    end
  end

  private

    def lecture_time_params
      params.require(:lecture_time).permit(:title, problems_attributes: [:id, :name, :content, :_destroy])
    end
end

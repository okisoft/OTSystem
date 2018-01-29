class LecturesController < ApplicationController

  def new
    @lecture = Lecture.new
    @lecture.lecture_years.build
  end

  def create
    @lecture = Lecture.new(lecture_params)
    if @lecture.save
      flash[:succeess] = "登録しました"
      redirect_to edit_lecture_year_path(@lecture)
    else
      flash[:danger] = "失敗しました"
      render 'new'
    end
  end

  def edit
    @lecture = Lecture.find(params[:id])
  end

  def update
    @lecture = Lecture.find(params[:id])
    if @lecture.update_attributes(lecture_params)
      redirect_to admin_path(@lecture)
    else
      render 'edit'
    end
  end

  private

    def lecture_params
      params.require(:lecture).permit(:name, lecture_years_attributes: [:id, :style, :year])
    end
end

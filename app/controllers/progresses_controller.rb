class ProgressesController < ApplicationController
  def index
    @lecture_time = LectureTime.find(params[:lecture_time_id])
    @users = @lecture_time.lecture_year.users
    @problems = @lecture_time.problems

    #publicの更新
    public_lecture = PublicLecture.first
    if public_lecture.nil?
      PublicLecture.create(
        user_id: current_user.id,
        lecture_id: @lecture_time.lecture_year.lecture.id,
        lecture_time_id: @lecture_time.id
      )
    else
      public_lecture.update(
        user_id: current_user.id,
        lecture_id: @lecture_time.lecture_year.lecture.id,
        lecture_time_id: @lecture_time.id
      )
    end
  end

  def update
    @progress = Progress.find_by(id: params[:id], user_id: current_user.id)
    if @progress.update(progress_params)
      redirect_to home_path
    end
  end

  private

    def progress_params
      params.require(:progress).permit(:icon)
    end
end

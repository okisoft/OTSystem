class LectureTimesController < ApplicationController
  @problems = []  # 初期化
  def questions_index
    @lecture_time = LectureTime.find(params[:id])
    @problems = @lecture_time.problems.all
  end
end

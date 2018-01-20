class LectureTimesController < ApplicationController
  @problems = []  # 初期化
  @progresses = []
  def questions_index
    @lecture_time = LectureTime.find(params[:id])
    #binding.pry
    @problems = @lecture_time.problems.all
  end

  def progresses_index
    @lecture_time = LectureTime.find(params[:id])
    binding.pry
    @progresses = @lecture_time.progresses.all
  end
end

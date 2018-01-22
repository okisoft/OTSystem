class LectureTimesController < ApplicationController
  def questions_index
    lecture_time = LectureTime.find(params[:id])
    @problems = lecture_time.problems.all
  end

  def progresses_index
    @lecture_time = LectureTime.find(params[:id])
    progresses = @lecture_time.progresses.all
    @achievments_array = []
    progress_count = Array.new(@lecture_time.problems.count, 0) # 課題のレコード数を取得
    progresses.each do |progress|
      @achievments_array.push([progress, progress_count]) # 課題が3つなら[nil, nil, nil]を配列に追加
    end
    # userの数:2、課題の数:3なら
    # [[nil,nil,nil],[nil,nil,nil]]

    # public_lectureの更新
    lecture = @lecture_time.lecture_year.lecture
    @public_lectures = PublicLecture.all
    @public_lectures.update(user_id: current_user.id, lecture_id: lecture.id, lecture_time_id: @lecture_time.id)
  end
end

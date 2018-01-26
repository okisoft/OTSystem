class LectureYearsController < ApplicationController
  def lecture_times_new
    @lecture_year = LectureYear.find(params[:id])
    @lecture_year.lecture_times.build
  end

  def lecture_times_create
    @lecture_year = LectureYear.find(params[:id])

    if @lecture_year.update_attributes(lecture_year_params)
      # 課題数を取り出す
      lecture_times_params = params[:lecture_year][:lecture_times_attributes]
      i = 0
      lecture_times_params.keys.each do |key|
        time_ = lecture_times_params[key][:time].to_i #課題数
        lecture_time_id = @lecture_year.lecture_times[i].id
        time_.times do |t|
          problem = Problem.new(
            lecture_time_id: lecture_time_id,
            name: "課題#{t + 1}",
            content: ""
          )
          problem.save
        end
        i += 1
      end
      redirect_to admin_path
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
      params.require(:lecture_year).permit(:year, :style, lecture_times_attributes: [:id, :title, :time, :_destroy])
    end
end

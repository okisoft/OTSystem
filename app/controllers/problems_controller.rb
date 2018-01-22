class ProblemsController < ApplicationController
  def edit
    @problem = Problem.find(params[:id])
  end

  def update
    @problem = Problem.find(params[:id])
    if @problem.update_attributes(problem_params)
      @lecture_time = @problem.lecture_time
      redirect_to problems_lecture_time_path(@lecture_time.id)
    else
      render 'edit'
    end
  end

  private

    def problem_params
      params.require(:problem).permit(:lecture_time_id, :name, :content)
    end
end

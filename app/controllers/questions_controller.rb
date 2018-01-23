class QuestionsController < ApplicationController
  def new
    @question = Question.new
    problems = Problem.where(lecture_time_id: PublicLecture.first.lecture_time_id)

    @problems_array = []
    problems.each do |pr|
      @problems_array.push([pr.name, pr.id])
    end
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:succeess] = "登録しました"
      redirect_to home_path
    else
      flash[:danger] = "失敗しました"
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      @lecture_time = @question.problem.lecture_time
      redirect_to questions_lecture_time_path(@lecture_time.id)
    else
      render 'edit'
    end
  end

  private

    def question_params
      params.require(:question).permit(:problem_id, :user_id, :content, :reply, :visible)
    end
end

class QuestionsController < ApplicationController
  def new
    @question = Question.new
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

  private

    def question_params
      params.require(:question).permit(:problem_id, :user_id, :content, :reply, :visible)
    end
end

class QuestionsController < ApplicationController
  def index
    lecture_time = LectureTime.find(params[:id])
    @problems = lecture_time.problems
    @questions = @problems.questions
  end
end

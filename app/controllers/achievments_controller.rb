class AchievmentsController < ApplicationController
  def update
    @achievment = Achievment.find(params[:id])
    if @achievment.update_attributes(achievment_params)
      redirect_to home_path
    end
  end

  private

    def achievment_params
      params.require(:achievment).permit(:user_id, :problem_id, :achieved)
    end
end

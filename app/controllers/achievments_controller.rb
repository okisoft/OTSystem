class AchievmentsController < ApplicationController

  def update
    achievments_params.each do |id, achievment_param|
      achievment = Achievment.find_by(id: id, user_id: current_user.id)
      achievment.update_attributes(achievment_param)
    end
    redirect_to home_path
  end

  private

    def achievments_params
      params.permit(achievments: [:problem_id, :achieved])[:achievments]
    end
end

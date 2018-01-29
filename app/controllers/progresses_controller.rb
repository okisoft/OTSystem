class ProgressesController < ApplicationController
  def update
    @progress = Progress.find_by(id: params[:id], user_id: current_user.id)
    if @progress.update(progress_params)
      redirect_to home_path
    end
  end

  private

    def progress_params
      params.require(:progress).permit(:icon)
    end
end

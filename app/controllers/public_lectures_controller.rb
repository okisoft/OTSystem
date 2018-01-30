class PublicLecturesController < ApplicationController

  def destroy
    PublicLecture.first.destroy
    flash[:success] = "PulicLecture destroyed."
    redirect_to admin_url
  end
end

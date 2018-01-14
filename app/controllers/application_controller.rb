class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :exception
  before_action :require_login

  def render_404
    render file: '/public/404.html', status: 404, layout: 'application', content_type: 'text/html'
  end

  def render_not_open
    render file: '/public/not_open.html', status: 404, layout: 'application', content_type: 'text/html'
  end

  private
    def require_login
      unless logged_in?
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
end

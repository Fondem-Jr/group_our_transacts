class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authorize
    protected
    before_action :current_user

    def authorize
        unless User.find_by(id: session[:user_id])
            redirect_to login_url, notice:"You are trying to access without permission"
        end
    end

    def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end

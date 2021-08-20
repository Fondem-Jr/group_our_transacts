class SessionsController < ApplicationController
  skip_before_action :authorize
  def new; end

  def create
    user = User.find_by(name: params[:name])
    if user
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: 'Invalid Username'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, alert: 'Successfully logged out'
  end
end

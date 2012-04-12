class SessionsController < ApplicationController
  def new
  end

  def create
    session[:uid] = User.find_or_create_by_hash(request.env['omniauth.auth']).uid
    redirect_to root_path, :notice => "Welcome #{current_user.first_name}! Who are we going out today?"
  end
end

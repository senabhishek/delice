class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = get_auth_hash
    if session[:user_id]
      User.find(session[:user_id]).add_provider(auth_hash)
    else
      auth = Authorization.find_or_create(auth_hash)
      session[:user_id] = auth.user.id
    end
    redirect_back_or auth.user
  end

  def failure
    flash[:error] = "Sorry, but you didn't allow access to our app!"
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  protected

  def get_auth_hash
    request.env['omniauth.auth']
  end
end

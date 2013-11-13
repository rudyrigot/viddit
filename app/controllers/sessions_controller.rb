class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash.now.alert = 'Wrong email/password combination'
      render :new
    end
  end
end

class SessionsController < ApplicationController

  def new
  end

  def create
    # user = User.find_by_email(params[:email])

    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      flash[:notice] = "Successfully logged in"
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end
end

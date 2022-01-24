class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect_to polls_path
    else
      message = 'Something went wrong. Make sure your username and password are correct.'
      redirect_to login_path, notice: message
    end
  end

  def destroy
    session.delete(:user_id)

    flash[:success] = "You have successfully logout!"
    redirect_to root_url
  end
end

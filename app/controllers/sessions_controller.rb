class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.authenticate(params[:email], params[:password])
  	if @user
  		session[:user_id] = @user.id
  		redirect_to @user, notice: "Success!"
  	else
  		redirect_to login_path, notice: "Please log in."
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path, notice: "You have logged out."
  end
end

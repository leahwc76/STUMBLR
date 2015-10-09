class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(email: params[:email])
  	if @user and @user.password == params[:password]
  		session[:user_id] = @user.id
  		redirect_to @user, notice: "Success!"
  	else
  		redirect_to login_path, notice: "Please log in."
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_path, notice: "You have logged out."
  end
end

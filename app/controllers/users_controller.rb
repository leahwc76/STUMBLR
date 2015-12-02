class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:profile, :edit, :update, :destroy]
  before_action :authorize_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def show
    
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to @user, notice: "May the force be with you!"
  end

  def profile
    @user = current_user
    render :show
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to new_user_path, notice: "Account Destroyed."
  end

private

  def set_user
    begin
      if params[:username]
        username = params[:username]
        @user = User.where('lower(username) = ?', username.downcase).first
        unless @user
          flash[:notice] = "User cannot be found"
          redirect_to users_path
        end
      else
        @user = User.find(params[:id])
      end
    rescue
      flash[:notice] = "User cannot be found."
      redirect_to users_path
    end 
  end

  def user_params
    params.require(:user).permit(:username, :email, :fname, :lname, :location, :bio, :password, :password_confirmation)
  end

  def authorize_user
    unless current_user == @user 
      redirect_to root_path, notice: "You do not have permission to do that!"
    end
  end

end

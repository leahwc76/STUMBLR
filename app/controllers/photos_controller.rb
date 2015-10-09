class PhotosController < ApplicationController
  def index
  	@photos = Photo.order('created_at')
  end

  def new
  	@photo = Photo.new
  end

  def create
  	@photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
  	if @photo.save
      redirect_to profile_path
  		flash[:notice] = "The photo was added!"
  	else
  		redirect_to profile_path
  	end
  end


  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:success] = "The photo was destroyed."
    redirect_to profile_path
  end

  private 
  
  def photo_params
  	params.require(:photo).permit(:image, :title).merge(user: current_user )
  end
end

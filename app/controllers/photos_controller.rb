# photoscontroller, uses paperclip
class PhotosController < ApplicationController
  def index
    @assignment = Assignment.find(params[:assignment_id])
    @photos = Photo.where(assignment: @assignment, user: current_user)
    @adminphotos = Photo.where(assignment: @assignment)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user = User.find(params[:user])
    @photo.assignment = Assignment.find(params[:assignment])
    @photo.user.photos << @photo
    if @photo.save
      flash[:notice] = 'Successfully added new photo!'
      redirect_to @photo.user
    else
      flash[:alert] = 'Error adding new photo!'
      render :new
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      flash[:success] = 'The photo was destroyed.'
      redirect_to root_path
    else
      flash[:alert] = 'Error deleting photo!'
      render :index
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :image)
  end
end

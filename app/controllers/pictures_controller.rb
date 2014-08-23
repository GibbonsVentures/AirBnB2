class PicturesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @pictures = Picture.all
  end

  def new
    @place = Place.find(params[:place_id])
    @picture = current_user.pictures.build
  end

  def create
    @picture = current_user.pictures.build
    @picture.user_id = current_user.id
    if @picture.save
      flash[:notice] = "Thanks for adding picture"
    else
      flash[:error] = "You messed it up dumbo"
    end
    redirect_to root_path
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      flash[:notice] = 'Picture Updated'
      redirect_to picture_path(@picture)
    else
      flash[:notice] = 'Failed to Update'
      redirect_to :back
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    flash[:notice] = "Picture Deleted"
    redirect_to logout_path
  end

 private
    def set_picture
      @picture = Picture.find(params[:id])
    end
    def correct_user
      @picture = current_user.pictures.find_by(id: params[:id])
      redirect_to @place, notice: "Not authorized to edit this place" if @picture.nil?
    end

    def picture_params
    params.require(:picture).permit(:image, :description, :place_id, :user_id)
  end
end
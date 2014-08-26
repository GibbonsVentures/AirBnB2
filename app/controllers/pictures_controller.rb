class PicturesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @pictures = Picture.all
  end

  def new
    @place = Place.find(params[:place_id])
    @picture = Picture.new
  end

  def create
    @place = Place.find(params[:place_id])
    @picture = Picture.new(picture_params)
     if @picture.save
      flash[:notice] = "Thanks for adding a new picture!"
      redirect_to place_path(@picture.place)
    else
      redirect_to new_place_picture_path(@place)
    end
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

    

  def picture_params
    params.require(:picture).permit(:image, :description, :place_id)
  end
end
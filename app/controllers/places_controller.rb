class PlacesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :correct_user, only: [:edit, :update, :destroy]



  def index
    @places = Place.search(params[:search])
    @pictures = Picture.all
    if params[:search]
      @places = Place.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    else
      @places = Place.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
      
    end
  end
  
 
  
  def show
    @place = Place.find(params[:id])
    @reservation = Reservation.new
    @review = Review.new
    #storing as intance variable. to be used on 
  end

  def new
    @place = current_user.places.build
  end

  def edit
    @place = Place.find(params[:id])
    
  end

  def create
    @place = current_user.places.build(place_params)
    if @place.save
      redirect_to @place, notice: 'Your place can now be rented!'
    else
      render action: 'new'
    end
  end

  def update
    @place = Place.find(params[:id])
    if  @place.update(place_params)
      redirect_to @place, notice: 'Place was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to places_url
  end


private
    def correct_user
      @place = current_user.places.find_by(id: params[:id])
      redirect_to places_path, notice: "Not authorized to edit this picture" if @place.nil?
    end
    
    
    def place_params
      params.require(:place).permit(:kind, :address, :state, :price, :description, :availability, :owner_id)
    end
end
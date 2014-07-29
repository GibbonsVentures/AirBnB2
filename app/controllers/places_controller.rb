class PlacesController < ApplicationController
 
  before_action :authenticate_user!, except: [:index]



  def index
    if params[:search]
      @places = Place.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    else
      @places = Place.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    end
  end
  
 
  
  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = current_user.places.build
  end

  def edit
  end

  def create
    @place = current_user.places.build(place_params)
    if @place.save
      redirect_to @place, notice: 'place was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if  @place.update(place_params)
      redirect_to @place, notice: 'place was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @place.destroy
    redirect_to places_url
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end
    def correct_user
      @place = current_user.places.find_by(id: params[:id])
      redirect_to places_path, notice: "Not authorized to edit this picture" if @place.nil?
    end
   

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:kind, :address, :state, :price, :description, :availability)
    end
end
class RidersController < ApplicationController
  before_action :authenticate_user!

  before_action :find_rider, :only => [:show, :edit, :update]
  before_action :get_all_categories, :only => [ :new, :create, :edit, :update, :index, :search_riders]
  
  def index
     params[:category_id] = params[:category_id].blank? ? 1 : params[:category_id]
    @riders = Rider.get_riders_by_category_id( params[:category_id] ).order(:category_id)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @rider = Rider.new
  end

 
  def create
    @rider = Rider.new(rider_params)
 
    if @rider.save
      redirect_to @rider
    else
      render 'new'
    end
  end

  def show
    #TODO: SHOW A RIDER IFORMATION
  end

  def search_riders
    search_rider = params[:search_rider]
    @riders = Rider.where("first_name ILIKE(?) OR last_name ILIKE(?)", search_rider, search_rider)
    respond_to do |format|
      format.html {redirect_to riders_path}
      format.js
    end
  end

  def edit
  end

  def update
    if @rider.update(rider_params)
      redirect_to @rider
    else
      render 'edit'
    end
  end

  def destroy
    #TODO: destroy if don't have any relationship
  end

  private
  def rider_params
    params.require(:rider).permit(:first_name, :last_name, :birthdate, :address, :city, :state, :phone, :email, :bood_type, :number, :category_id)
  end

  def find_rider
    @rider = Rider.find(params[:id])
  end
end
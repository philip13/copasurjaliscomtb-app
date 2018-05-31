class RidersController < ApplicationController
  before_action :authenticate_user!

  before_action :find_rider, :only => [:show, :edit, :update, :destroy]
  before_action :get_all_categories_picklist, :only => [ :new, :create, :edit, :update, :index, :search_riders]
  
  def index
    params[:category_id] = params[:category_id].blank? ? Category.first.id : params[:category_id]
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
    search_rider = params[:rider_name]
    unless search_rider.blank?
      @riders = Rider.search_full_name(search_rider)
    else
      @riders = Rider.get_riders_by_category_id( Category.first.id ).order(:category_id)
    end
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
    if @rider.registers.empty?
      flash[:notice] = "Rider destroy successfully"
      redirect_to riders_path()
    else
      flash[:alert] = "Rider can'r destroy / first remove other information "
      redirect_to riders_path()
    end
  end

  private
  def rider_params
    params.require(:rider).permit(:first_name, :last_name, :birthdate, :address, :city, :state, :phone, :email, :bood_type, :number, :category_id)
  end

  def find_rider
    @rider = Rider.find(params[:id])
  end
end
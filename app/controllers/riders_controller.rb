class RidersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_rider, :only => [:show, :edit, :update]
  before_action :get_all_categories, :only => [ :new, :create, :edit, :update]
  def index
    @riders = Rider.all
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
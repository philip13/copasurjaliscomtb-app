class RidersController < ApplicationController
  def index
  end

  def new
    @rider = Rider.new
  end

 
  def create
    #TODO save a new rider
    # redirect to show
    redirect_to "/"
  end

  def show
    #TODO: SHOW A RIDER IFORMATION
  end

  def edit
  end

  def update
  end

  def destroy
    #TODO: destroy if don't have any relationship
  end

  private
  def rider_params
    params.require(:rider).permit(:first_name, :last_name, :birthdate, :address, :city, :state, :phone, :email, :bood_type, :number)
  end
end
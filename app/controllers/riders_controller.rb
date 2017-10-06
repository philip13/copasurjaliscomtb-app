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
end

class RacesController < ApplicationController
    before_action :find_race, :only => [:show, :edit, :update]
  def index
    @races = Race.all
  end

  def new
    @race = Race.new
  end

 
  def create
    @race = Race.new(race_params)
 
    if @race.save
      redirect_to @race
    else
      render 'new'
    end
  end

  def show
    #TODO: SHOW A race IFORMATION
  end

  def edit
  end

  def update
    if @race.update(race_params)
      redirect_to @race
    else
      render 'edit'
    end
  end

  def destroy
    #TODO: destroy if don't have any relationship
  end

  private
  def race_params
    params.require(:race).permit(:title, :date, :photo, :description)
  end

  def find_race
    @race = Race.find(params[:id])
  end
end
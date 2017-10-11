class RegistersController < ApplicationController 
  before_action :get_all_races, :get_all_categories, :only => [ :new, :create, :edit, :update]
  before_action :find_rider, :only => [ :new, :create, :edit, :update, :index, :destroy]

  before_action :find_register, :only => [:show, :edit, :update, :destroy]

  def index
    @registers =  Register.get_registers_by_rider_id( params[:rider_id] )
  end

  def new
    @register = Register.new
  end

 
  def create
    @register = Register.new(register_params)
 
    if @register.valid?
      @rider.registers << @register
      redirect_to rider_register_path(rider_id: @rider.id)
    else
      render 'new'
    end
  end

  def show
    #TODO: SHOW A category IFORMATION
  end

  def edit
  end

  def update
  end

  def destroy
    #TODO: destroy if don't have any relationship
    @register.destroy!
    redirect_to rider_registers_path(rider_id: @rider.id)
  end

  private
  def register_params
    params.require(:register).permit(:category, :race_id, :rider_id, :race_result, :points)
  end


  def find_rider
    @rider = Rider.find(params[:rider_id])
  end

  def find_register
    @register = Register.find(params[:id]) 
  end

  def get_all_races 
    @races =  Race.all.map{|r| [] << r.title  << r.id}
  end

  def get_all_categories
    @categories =  Category.all.map{|c| [] << c.name  << c.id}
  end
end


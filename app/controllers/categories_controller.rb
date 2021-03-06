class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_category, :only => [:show, :edit, :update, :destroy]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

 
  def create
    @category = Category.new(category_params)
 
    if @category.save
      redirect_to @category
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
    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy!  if Register.where("category = ?", @category.id).empty?
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name, :code, :years_range, :laps, :city, :state, :phone, :email, :bood_type, :number, :group)
  end

  def find_category
    @category = Category.find(params[:id])
  end 
end
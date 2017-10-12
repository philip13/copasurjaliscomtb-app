class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  private
  def get_all_categories
    @categories =  Category.all.map{|c| [] << c.name  << c.id}
  end
end

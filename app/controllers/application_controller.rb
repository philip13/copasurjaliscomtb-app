class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  private
  def get_all_categories
    if action_name == 'index' && controller_name == 'home'
      @categories =  (Category.get_all_categories_by_groups_order(Date.new(2017, 12, 31) ) ).map{|c| [] << c.name  << c.id}
    else
      @categories = Category.get_all_categories_by_groups_order(Date.today+1.day ).map{|c| [] << c.name  << c.id}
    end
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  private
  def get_all_categories
    if action_name == 'ranking' && controller_name == 'home'
      @categories =  (Category.get_all_categories_by_groups_order(Date.new(params[:year].to_i, 12, 31) ) ).map{|c| [] << c.name  << c.id << c.active}
    else
      @categories = (Category.get_all_categories_by_groups_order(Date.today+1.day ) ).map{|c| [] << c.name  << c.id << c.active}
    end
  end

  def get_all_categories_picklist
    @categories =  (Category.get_all_categories_by_groups_order(Date.today ) ).map{|c| [] << c.name  << c.id }
  end
end

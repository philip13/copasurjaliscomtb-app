class HomeController < ApplicationController
  before_action :get_all_categories, :only => [ :index]
  def index
    category_id = params[:category].blank? ? 1 : params[:category]
    @riders_results = Register.get_general_clasification_by_category category_id

    respond_to do |format|
      format.html
      format.js
    end
  end
end

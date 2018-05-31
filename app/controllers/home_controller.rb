class HomeController < ApplicationController
  before_action :get_all_categories, :only => [ :ranking, :race_results]
  before_action :parse_year, :only => [:ranking, :races_of_year]
  
  def index  
  end

  def ranking
    # @year = params[:year].blank? ? 2017 : params[:year].to_i

    category_id = params[:category].blank? ? 1 : params[:category]
    @riders_results = Register.get_general_clasification_by_category category_id, Date.new(@year, 1, 1), Date.new(@year, 12, 31)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def races_of_year
    @races = Race.get_races_of_range Date.new(@year, 1, 1), Date.new(@year, 12, 31)
  end

  def race_results
    category_id = params[:category].blank? ? 1 : params[:category]

    @race = Race.find params[:race_id] 

    @riders_results = Register.get_race_result_by_category @race.id ,category_id unless @race.nil?
  end

  def road
  end

  def donation
  end

  private
  def parse_year
     @year = params[:year].blank? ? 2017 : params[:year].to_i
  end
end

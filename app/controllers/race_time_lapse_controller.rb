class RaceTimeLapseController < ApplicationController
  before_action :authenticate_user!
  before_action :get_available_races, :only => [:index]
  protect_from_forgery except: :index


  def index
    @race = Race.find params['race_id'] if params['race_id']
    @start_lab = params['start_lap'] if params['start_lap']

    respond_to do |format|
      if !@race.blank? && !@start_lab.blank?
        @date_time_start_lap =  DateTime.parse("#{@today.year}-#{@today.month}-#{@today.day} #{params['start_lap']} -0500")
        @race_time_lapses = RaceTimeLapse.where("race_id = ?", @race.id).order("created_at")
      else
        @race_time_lapses = RaceTimeLapse.all.order("created_at")
      end
        format.html
        format.js
    end

  end

  def create_time_lap
    d = DateTime.parse(params['start_lap'])
    respond_to do |format|
      @race_time_lapse = RaceTimeLapse.new(race_id: params['race_id'], start_lap: d)
      if @race_time_lapse.save!
        p "@race_time_lapse.save! #{@race_time_lapse.inspect}"
      end
      format.html
      format.js
    end
  end

  def edit
    @race_time_lapse = RaceTimeLapse.find params[:id]
    p "@race_time_lapse = #{@race_time_lapse.inspect}"
    respond_to do | format |
      format.js
    end
  end

  def update
    @race_time_lapse = RaceTimeLapse.find params[:id]
    respond_to do | format |
      @race_time_lapse.pad_number= race_time_lapse_params[:pad_number]
      @race_time_lapse.save!
      format.js
    end
  end

  def destroy
    p "DELETE #{params[:id]}"
    @race_time_lapse = RaceTimeLapse.find params[:id]
    @race_time_lapse.destroy!
    p "@race_time_lapse #{@race_time_lapse.inspect}"
    respond_to do | format |
      format.js
    end
  end

  private
  def race_time_lapse_params
    params.require(:race_time_lapse).permit(:id, :register_id, :rider_id, :start_lap, :end_lap, :created_at, :updated_at, :race_id, :pad_number)
  end
  def get_available_races
    @today = Date.today
    @races = Race.get_races_of_range @today - 1.day, Date.new(@today.year, 12, 31)
  end
end

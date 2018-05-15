class Register < ApplicationRecord
  belongs_to :race
  belongs_to :rider

  def self.get_registers_by_rider_id rider_id
    self.joins(:race).where("rider_id = ?", rider_id).order("races.date ASC")
  end

  def self.get_general_clasification_by_category category_id, start_date, end_date
 self.joins("INNER JOIN riders ON riders.id = registers.rider_id INNER JOIN races ON races.id = registers.race_id").select("riders.first_name as first_name, riders.last_name as last_name,  SUM (registers.points) as points_earned, registers.category, registers.rider_id ").where("registers.category = ? AND (races.date >= ? OR races.date <= ? )", category_id, start_date, end_date).group("registers.rider_id, riders.first_name,  riders.last_name, registers.category,  registers.rider_id").order("points_earned desc")
    #self.joins(:rider).select("riders.first_name as first_name, riders.last_name as last_name,  SUM (registers.points) as points_earned, registers.category, registers.rider_id ").where("registers.category = ?", category_id).group("registers.rider_id, riders.first_name,  riders.last_name, registers.category,  registers.rider_id").order("points_earned desc")
  end
end

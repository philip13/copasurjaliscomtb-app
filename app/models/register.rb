class Register < ApplicationRecord
  belongs_to :race
  belongs_to :rider

  def self.get_registers_by_rider_id rider_id
    self.where("rider_id = ?", rider_id)
  end
end

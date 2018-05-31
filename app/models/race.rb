class Race < ApplicationRecord
  has_many :registers
  has_many :riders, through: :registers
  accepts_nested_attributes_for :riders


  def self.get_races_of_range start_date, end_date
    self.where("date >= ? AND date <= ? ", start_date, end_date).order("date")
  end
end

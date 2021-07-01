class RaceTimeLapse < ApplicationRecord
  belongs_to :register, optional: true
  belongs_to :rider, optional: true
  before_create :set_endlap

  def set_endlap
    self.end_lap = DateTime.now
  end
end

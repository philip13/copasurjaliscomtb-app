class AddRaceIdToRaceTimeLapse < ActiveRecord::Migration[5.1]
  def change
    add_reference :race_time_lapses, :race, foreign_key: true
  end
end

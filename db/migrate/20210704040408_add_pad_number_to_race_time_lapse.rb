class AddPadNumberToRaceTimeLapse < ActiveRecord::Migration[5.1]
  def change
    add_column :race_time_lapses, :pad_number, :integer
  end
end

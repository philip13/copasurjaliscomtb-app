class CreateRaceTimeLapses < ActiveRecord::Migration[5.1]
  def change
    create_table :race_time_lapses do |t|
      t.references :register, foreign_key: true
      t.references :rider, foreign_key: true
      t.timestamp :start_lap
      t.timestamp :end_lap

      t.timestamps
    end
  end
end

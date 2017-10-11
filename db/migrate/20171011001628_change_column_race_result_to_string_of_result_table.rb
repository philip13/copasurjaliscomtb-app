class ChangeColumnRaceResultToStringOfResultTable < ActiveRecord::Migration[5.1]
  def change
    change_column :registers, :race_result, :string
  end
end

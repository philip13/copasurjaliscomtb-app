class AddColumnPointsToRegisters < ActiveRecord::Migration[5.1]
  def change
    add_column :registers, :points, :integer
  end
end

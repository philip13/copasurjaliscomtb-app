class AddPadNumberToRegisters < ActiveRecord::Migration[5.1]
  def change
    add_column :registers, :pad_number, :integer
  end
end

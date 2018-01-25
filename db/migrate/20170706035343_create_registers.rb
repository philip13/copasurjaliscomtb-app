class CreateRegisters < ActiveRecord::Migration[5.0]
  def change
    create_table :registers do |t|
      t.integer :category
      t.references :race, foreign_key: true
      t.references :rider, foreign_key: true
      t.integer :race_result

      t.timestamps
    end
  end
end

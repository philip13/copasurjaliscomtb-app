class CreateRaces < ActiveRecord::Migration[5.0]
  def change
    create_table :races do |t|
      t.string :title
      t.date :date
      t.string :photo
      t.string :description

      t.timestamps
    end
  end
end

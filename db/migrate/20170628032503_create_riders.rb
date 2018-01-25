class CreateRiders < ActiveRecord::Migration[5.0]
  def change
    create_table :riders do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.string :address
      t.string :city
      t.string :state
      t.string :phone
      t.string :email
      t.string :bood_type
      t.integer :number

      t.timestamps
    end
  end
end

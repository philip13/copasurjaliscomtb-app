class AddCategoryToRiders < ActiveRecord::Migration[5.1]
  def change
    add_column :riders, :category_id, :integer
  end
end

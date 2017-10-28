class AddGroupToCategory < ActiveRecord::Migration[5.1]
  def up
    add_column :categories, :group, :string
  end

  def down
    remove_column :categories, :group, :string
  end
end

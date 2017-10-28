class Category < ApplicationRecord

  def self.get_all_categories_by_groups_order
    self.order("categories.name asc, case when categories.group = 'SEGUNDO GRUPO'  then 1 when categories.group = 'PRIMER GRUPO' then 2 when categories.group = 'INFANTILES' then 3 end")
  end
end

class Category < ApplicationRecord

  def self.get_all_categories_by_groups_order date_filter
    self.where("created_at <= ?", date_filter).order("case when categories.group = 'SEGUNDO GRUPO'  then 1 when categories.group = 'PRIMER GRUPO' then 2 when categories.group = 'INFANTILES' then 3 end, categories.name asc")
  end

end

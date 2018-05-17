class Rider < ApplicationRecord
  include PgSearch
  pg_search_scope :search_full_name, :against => %i(first_name last_name)

  has_many :registers
  has_many :races, through: :registers

  accepts_nested_attributes_for :races

  def self.get_riders_by_category_id category_id
    self.where("category_id = ?", category_id)
  end
end

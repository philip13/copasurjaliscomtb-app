class Register < ApplicationRecord
  belongs_to :category
  belongs_to :race
  belongs_to :rider
end

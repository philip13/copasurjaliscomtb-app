class Rider < ApplicationRecord
  has_many :registers
  has_many :races, through: :registers

  accepts_nested_attributes_for :races
end

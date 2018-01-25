class Race < ApplicationRecord
  has_many :registers
  has_many :riders, through: :registers
  accepts_nested_attributes_for :riders
end

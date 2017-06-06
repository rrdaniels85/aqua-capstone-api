class Animal < ApplicationRecord
  belongs_to :tank, foreign_key: 'tank_id'

  validates :name, presence: true
  validates :species, presence: true
  validates :color, presence: true
end

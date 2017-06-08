# frozen_string_literal: true

class Animal < ApplicationRecord
  belongs_to :tank, foreign_key: 'tank_id'

  validates :name, presence: true
  validates :species, presence: true
  validates :color, presence: true

  validates_length_of :name, maximum: 60
  validates_length_of :species, maximum: 60
  validates_length_of :color, maximum: 60
end

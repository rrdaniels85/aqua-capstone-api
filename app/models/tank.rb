# frozen_string_literal: true

class Tank < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :animals, dependent: :destroy

  validates :name, presence: true
  validates :water, presence: true
  validates_length_of :name, maximum: 60
  enum water: { Salt: 'Salt', Fresh: 'Fresh' }
end

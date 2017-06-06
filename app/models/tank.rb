# frozen_string_literal: true

class Tank < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :animals

  validates :name, presence: true
  validates :water, presence: true
  enum water: { salt: 'Salt', fresh: 'Fresh' }
end

# frozen_string_literal: true

class Tank < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  validates :name, presence: true
  validates :water, presence: true
end

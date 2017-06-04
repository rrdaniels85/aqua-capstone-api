class Tank < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  validates :name, presence: true
  validates :type, presence: true
end

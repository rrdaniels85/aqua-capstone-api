class TankSerializer < ActiveModel::Serializer
  attributes :id, :name, :water
  has_one :user
end

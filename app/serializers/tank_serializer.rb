class TankSerializer < ActiveModel::Serializer
  attributes :id, :name, :type
  has_one :user
end

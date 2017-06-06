class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :name, :species, :color
  has_one :tank
end

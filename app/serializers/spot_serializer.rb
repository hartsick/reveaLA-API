class SpotSerializer < ActiveModel::Serializer
  attributes :name, :tag, :address, :lnglat, :created_by
end

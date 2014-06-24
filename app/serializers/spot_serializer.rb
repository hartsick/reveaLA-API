class SpotSerializer < ActiveModel::Serializer
  attributes :id, :name, :tag, :address, :lnglat, :created_by, :is_approved
end

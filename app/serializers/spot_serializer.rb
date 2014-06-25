class SpotSerializer < ActiveModel::Serializer
  attributes :name, :tag, :address, :latitude, :longitude

  def latitude
  	object.lnglat.y
  end

  def longitude
  	object.lnglat.x
  end
end

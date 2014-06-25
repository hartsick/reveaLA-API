class SpotSerializer < ActiveModel::Serializer
  attributes :name, :tag, :address, :latitude, :longitude

  def latitude
  	object.lnglat.x
  end

  def longitude
  	object.lnglat.y
  end
end

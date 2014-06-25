class SpotSerializer < ActiveModel::Serializer
  attributes :spot_id, :name, :tag, :address, :latitude, :longitude

  def spot_id
  	object.id
  end

  def latitude
  	object.lnglat.y
  end

  def longitude
  	object.lnglat.x
  end
end

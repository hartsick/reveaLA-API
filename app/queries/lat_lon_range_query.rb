class LatLonRangeQuery < RangeQuery
  def initialize(latitude, longitude, max_meters)
    super(Spot, :latlng, "POINT(#{longitude} #{latitude})", max_meters)
  end
end

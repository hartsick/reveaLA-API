class LatLonRangeQuery < RangeQuery
  def initialize(latitude, longitude, max_meters)
    super(Spot, :lnglat, "POINT(#{longitude} #{latitude})", max_meters)
  end
end

class LatLonRangeQuery < RangeQuery
  def initialize(latitude, longitude, max_meters, spot_id)
    super(Spot, :lnglat, "POINT(#{longitude} #{latitude})", max_meters, spot_id)
  end

  # selects all places except the place we are
  # querying against
  def not_self
    table[:id].not_eq(spot_id)
  end

  # only shows approved spots
  def approved
    table[:is_approved].eq(true)
  end  

  # override the limit function from the base class
  # to also include the not self filter
  def range_where
    close_by.and(not_self).and(approved)
  end
end

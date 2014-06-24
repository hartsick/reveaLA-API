class PlaceRangeQuery < RangeQuery
  def initialize(spot, max_meters)

    # setup the base class with Place as the model to query
    # and geocode as the attribute
    super(Spot, :lnglat, spot.lnglat, max_meters)

    @spot = spot
  end

  attr_reader :spot

  # selects all places except the place we are
  # querying against
  def not_self
    table[:id].not_eq(spot.id)
  end

  # override the limit function from the base class
  # to also include the not self filter
  def range_where
    close_by.and(not_self)
  end

  # add in "not yet found" parameter

end

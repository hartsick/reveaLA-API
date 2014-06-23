class RangeQuery 

	def initialize(model, location_attribute, point, max_meters)
		# model to query against
		@model = model

		# attribute on model representing geocoded location
		@location_attribute = location_attribute

		# point to query against
		@point = point

		# max range for results
		@max_meters = max_meters
	end

	attr_reader :model, :location_attribute, :point, :max_meters

	def table
		@table ||= model.arel_table
	end

	def distance
		@distance ||= table[location_attribute].st_distance(point)
	end

	def range_select
		model.select('*').select(distance.as('range'))
	end

	def close_by
		table[location_attribute].st_functoin("ST_DWITHIN", point, max_meters)
	end

	def range_order
		'range ASC'
	end

	def range_where
		close_by
	end

  def results
    range_select.where(range_where).order(range_order)
  end

end
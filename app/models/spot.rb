class Spot < ActiveRecord::Base
	# create spatial point from geocode data
	geocoded_by :full_street_address do |obj,results|
	  if geo = results.first
	  	@lat = geo.latitude
	  	@lng = geo.longitude
	  end
	end
	after_validation :geocode

	has_many :users, through: :user_spots
	has_many :user_spots

	validates_presence_of :name, :tag, :city, :created_by
	# validates_presence_of :lnglat

	validates_length_of :state, is: 2
	validates_numericality_of :zip, only_integer: true, length: { is: 5 }
	validates_length_of :street, minimum: 5

	def full_street_address
		[street, city, state, zip].compact.join(' ')
	end
end

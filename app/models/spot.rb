class Spot < ActiveRecord::Base
	# create spatial point from address
	geocoded_by :address do |obj,results|
	  if geo = results.first
	  	obj.lnglat = 'POINT(' + geo.longitude.to_s + ' ' + geo.latitude.to_s + ')'
	  end
	end
	before_save :geocode

	has_many :users, through: :user_spots
	has_many :user_spots

	validates_presence_of :name, :tag, :city, :created_by
	validates_presence_of :lnglat, on: :save
	validates_presence_of :is_approved, on: :save

	validates :is_approved, inclusion: { in: [true, false] }

	validates_length_of :state, is: 2
	validates_length_of :zip, is: 5
	validates_length_of :street, minimum: 5

	def address
		[street, city, state, zip].compact.join(' ')
	end
end

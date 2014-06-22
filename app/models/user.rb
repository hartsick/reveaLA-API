class User < ActiveRecord::Base

	# Adds a password confirmation box in the sign up form
  has_secure_password

  validates_presence_of :name, :username, :email, :password_digest
  validates_uniqueness_of :email, :username
  validates_email_format_of :email

  validates :is_admin, inclusion: { in: [true, false] }
  validates_presence_of :is_admin, on: :save

	has_many :user_spots
	has_many :spots, through: :user_spots

	# set permissions for user
	def can_create?(resource)
		resource.can_be_created_by?(self)
	end

	def can_update?(resource)
		resource.can_be_updated_by?(self)
	end

	def can_destroy?(resource)
		resource.can_be_destroyed_by?(self)
	end

	def can_review?(resource)
		resource.can_be_reviewed_by?(self)
	end

end

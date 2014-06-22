class User < ActiveRecord::Base

	# Adds a password confirmation box in the sign up form
  has_secure_password

  validates_presence_of :name, :username, :email, :password_digest
  validates_uniqueness_of :email, :username
  validates_email_format_of :email

	has_many :user_spots
	has_many :spots, through: :user_spots

end

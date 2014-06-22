class User < ActiveRecord::Base

	# Adds a password confirmation box in the sign up form
  has_secure_password

  # validates :username, :presence => { :message => 'Please enter a username'}, :uniqueness => { :message => 'Username is taken'}
  # validates :name, :presence => true
  # validates :email, :presence => true, :uniqueness => true
  validates_presence_of :name, :username, :email, :password_digest
  validates_uniqueness_of :email, :username
  validates_email_format_of :email

  # Allows you to call the password temporarily but not after it's saved to the db
  def password
    @password
  end

  def password=(new_password)
    @password = new_password
    # This encrypted password is saved to the db
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def authenticate(test_password)
    # Tests the entered password against the encrypted password saved in the db
    if BCrypt::Password.new(self.password_digest) == test_password
      self
    # If the password doesn't match, return false
    else
      false
    end
  end

	has_many :user_spots
	has_many :spots, through: :user_spots

end

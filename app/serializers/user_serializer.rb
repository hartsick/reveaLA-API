class UserSerializer < ActiveModel::Serializer
  attributes :name, :username, :email, :password
  has_many :spots
end

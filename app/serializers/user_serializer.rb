class UserSerializer < ActiveModel::Serializer
  has_many :social_sites

  attributes :id, :email, :admin, :summary
end

class UserSerializer < ActiveModel::Serializer
  has_many :social_sites

  attributes :summary
end

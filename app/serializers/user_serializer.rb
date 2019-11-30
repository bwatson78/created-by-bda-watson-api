# frozen_string_literal: true

# Restricts the keys/values for the 'users/:id' call
class UserSerializer < ActiveModel::Serializer
  has_many :social_sites

  attributes :id, :email, :admin, :summary
end

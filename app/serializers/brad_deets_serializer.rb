# frozen_string_literal: true

# Restricts the keys/values for the 'brad_deets' call
class BradDeetsSerializer < ActiveModel::Serializer
  has_many :social_sites

  attributes :summary
end

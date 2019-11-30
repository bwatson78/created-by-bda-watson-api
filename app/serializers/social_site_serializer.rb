# frozen_string_literal: true

# Restricts the key/values for any API calls associated to SocialSites
class SocialSiteSerializer < ActiveModel::Serializer
  attributes :title, :link
end

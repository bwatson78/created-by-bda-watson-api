# frozen_string_literal: true

# defines model, validations and methods for SocialSite
class SocialSite < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :link
end

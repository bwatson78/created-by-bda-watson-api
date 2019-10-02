class SocialSite < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :link
end

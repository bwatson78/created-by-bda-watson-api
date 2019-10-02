class Blog < ApplicationRecord
  validates_presence_of :title, :summary
  has_many :posts
  has_one_attached :banner
end

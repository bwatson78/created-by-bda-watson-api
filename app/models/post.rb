class Post < ApplicationRecord
	validates_presence_of :content, :title
  belongs_to :blog
end

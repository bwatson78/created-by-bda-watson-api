class Post < ApplicationRecord
	validates_presence_of :content, :title
end

# frozen_string_literal: true

# Stubs out Post validations and methods.
class Post < ApplicationRecord
  validates_presence_of :content, :title
  belongs_to :blog
end

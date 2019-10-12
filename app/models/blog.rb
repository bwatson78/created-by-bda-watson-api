# frozen_string_literal: true

# Stubs out Blog model validations and methods
class Blog < ApplicationRecord
  validates_presence_of :title, :summary
  has_many :posts
  has_one_attached :banner
end

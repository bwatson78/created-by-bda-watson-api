# frozen_string_literal: true

# Provides actions for User API routes
class BlogsController < ApplicationController
  def index
    @blogs = Blog.all.sort_by(&:title)
    render json: @blogs.as_json
  end
end

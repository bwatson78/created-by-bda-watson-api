# frozen_string_literal: true

require 'rails_helper'
require './spec/helpers/blog_spec_helpers'
require './spec/helpers/user_spec_helpers'

RSpec.configure do |c|
  c.include BlogHelpers
  c.include UserHelpers
end

RSpec.describe '/blogs', type: :request do
  before(:each) do
    create_multiple_blogs
    request_blogs
    parsed_body
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  it 'returns all blogs' do
    expect(@body.size).to eq(2)
  end

  it 'returns empty if no blogs exist' do
    Blog.delete_all
    get '/blogs'
    parsed_body
    expect(@body.size).to eq(0)
  end
end

# frozen_string_literal: true

require 'rails_helper'
require './spec/helpers/user_spec_helpers'

RSpec.configure do |c|
  c.include UserHelpers
end

RSpec.describe '/users/:id success', type: :request do
  before(:each) do
    @user = new_user
    @social_sites = create_multiple_social_sites
    @token = request_login
    request_user_with_header
    parsed_body
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  it 'returns the right user' do
    expect(@body['id']).to eq(@user.id)
  end

  it 'returns all social sites' do
    expect(@body['social_sites'].size).to eq(2)
  end

  it 'returns the right keys' do
    expect(@body.keys).to eq(%w[id email admin summary social_sites])
  end
end

RSpec.describe '/users/:id failure', type: :request do
  before(:each) do
    @user = new_user
    @social_sites = create_multiple_social_sites
    @token = request_login
    request_user_with_header
    parsed_body
  end

  it 'returns status code 401 if no authorization header' do
    request_user
    expect(response).to have_http_status(401)
  end

  it 'returns status code 401 if no user found' do
    get "/users/#{@user.id + 1}",
        params: {},
        headers: { 'Authorization' => @token }
    expect(response).to have_http_status(401)
  end
end

RSpec.describe '/brads_deets', type: :request do
  before(:each) do
    @user = brad_user
    @social_sites = [
      ['Facebook', 'https://www.facebook.com/bwatson78'],
      ['Twitter', 'https://www.twitter.com/Bradleyatson']
    ].each { |site| @user.social_sites.create(title: site[0], link: site[1]) }
    request_brads_deets
    parsed_body
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  it 'returns the right keys' do
    expect(@body.keys).to eq(%w[summary social_sites])
  end

  it 'returns all social sites' do
    expect(@body['social_sites'].size).to eq(2)
  end
end

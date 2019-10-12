# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User', type: :request do
  before(:each) do
    @user = User.create(
      email: 'edwatanabe@bdawatson.com',
      password: 'Crapton123456789',
      password_confirmation: 'Crapton123456789',
      admin: true
    )
    @social_sites = [
      ['Facebook', 'https://www.facebook.com/bwatson78'],
      ['Twitter', 'https://www.twitter.com/Bradleyatson']
    ].each { |site| @user.social_sites.create(title: site[0], link: site[1]) }
    get "/users/#{@user.id}"
    @body = JSON.parse(response.body)
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
end

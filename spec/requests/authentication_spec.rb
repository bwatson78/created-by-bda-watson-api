# frozen_string_literal: true

require 'rails_helper'
require './spec/helpers/user_spec_helpers'

RSpec.configure do |c|
  c.include UserHelpers
end

RSpec.describe '/auth/login', type: :request do
  before(:each) do
    @user = brad_user
    post '/auth/login', :params => {:email => @user.email, :password => @user.password}
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  it 'returns a token' do
    expect(response.body['token']).not_to be_empty
  end

  it 'returns an expiration time' do
    expect(response.body['exp']).not_to be_empty
  end

  it 'returns expiration time as a string' do
    expect(response.body['exp']).to be_instance_of(String)
  end
end

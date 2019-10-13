# frozen_string_literal: true

require 'rails_helper'
require './spec/helpers/user_spec_helpers'

RSpec.configure do |c|
  c.include UserHelpers
  c.before(:each) do
    @new_user = new_user
  end
end

describe 'User#create' do
  it 'creates a new user' do
    # checking if worker created
    expect(User.all.size).to eq 1
  end
end

describe 'User validations' do
  it 'errs when email is empty' do
    @new_user.email = nil
    expect(@new_user).to_not be_valid
  end

  it "errs when email isn't valid" do
    @new_user.email = 'TedOTeddy'
    expect(@new_user).to_not be_valid
  end

  it 'errs when password is empty' do
    no_pass_user = new_user_pass_empty
    expect(no_pass_user).to_not be_valid
  end

  it 'errs when password_confirmation is empty' do
    no_pass_conf_user = new_user_pass_conf_empty
    expect(no_pass_conf_user).to_not be_valid
  end

  it 'errs when admin is empty' do
    @new_user.admin = nil
    expect(@new_user).to_not be_valid
  end
end

describe 'User associations' do
  it 'responds to associations' do
    expect(@new_user).to respond_to(:summary)
    expect(@new_user).to respond_to(:social_sites)
    expect(@new_user).to respond_to(:headshot)
  end
end

describe 'User#attach' do
  it 'attaches an image' do
    attach_image
    expect(@new_user.headshot).to be_attached
  end
end

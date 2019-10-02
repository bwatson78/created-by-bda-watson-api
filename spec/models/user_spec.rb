require 'rails_helper'

RSpec.describe 'User' do
  before(:each) do
    @new_user = User.create(
      email: "edwatanabe@bdawatson.com",
      password: "Crapton123456789",
      password_confirmation: "Crapton123456789",
      admin: true
    )
  end

  context '#create' do
    it 'creates a new user' do
      # checking if worker created
      expect(User.all.size).to eq 1
    end

    it 'errs when email is empty' do
      @new_user.email = nil
      expect(@new_user).to_not be_valid
    end

    it "errs when email isn't valid" do
      @new_user.email = "TedOTeddy"
      expect(@new_user).to_not be_valid
    end

    it "errs when password is empty" do
      no_pass_user = User.new(
        email: "edwatanabe@bdawatson.com",
        password: "",
        password_confirmation: "Crapton123456789",
        admin: true
      )
      expect(no_pass_user).to_not be_valid
    end

    it "errs when password_confirmation is empty" do
      no_pass_conf_user = User.new(
        email: "edwatanabe@bdawatson.com",
        password: "Crapton123456789",
        password_confirmation: "",
        admin: true
      )
      expect(no_pass_conf_user).to_not be_valid
    end

    it "errs when admin is empty" do
      @new_user.admin = nil
      expect(@new_user).to_not be_valid
    end
  end

  context '#summary' do
    it 'responds to #summary' do
      expect(@new_user).to respond_to(:summary)
    end
  end

  context '#social_sites' do
    it 'responds to #social_sites' do
      expect(@new_user).to respond_to(:social_sites)
    end
  end

  context '#headshot' do
    it 'responds to #headshot' do
      expect(@new_user).to respond_to(:headshot)
    end
  end
end

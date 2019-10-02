require 'rails_helper'

RSpec.describe 'SocialSites' do
	before(:each) do
    @user = User.create(
      email: "edwatanabe@bdawatson.com",
      password: "Crapton123456789",
      password_confirmation: "Crapton123456789",
      admin: true
    )
		@new_site = @user.social_sites.create(
			title: 'Facebook',
			link: 'https://www.facebook.com/bwatson78'
		)
	end

	context '#create' do
    it 'expects a new site to be created' do
      expect(@user.social_sites.size).to eq(1)
    end
	end

  it 'errs when title is empty' do
    @new_site.title = nil
    expect(@new_site).to_not be_valid
  end

  it 'errs when link is empty' do
    @new_site.link = nil
    expect(@new_site).to_not be_valid
  end
end

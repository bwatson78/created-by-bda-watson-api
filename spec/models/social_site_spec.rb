require 'rails_helper'
require './spec/helpers/user_spec_helpers'

RSpec.configure do |c|
  c.include UserHelpers
end

RSpec.describe 'SocialSites' do
	before(:each) do
    @user = new_user
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

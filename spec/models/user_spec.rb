require 'rails_helper'

RSpec.describe 'User' do
  before(:each) do 
    @new_user = User.create( 
      email: "edwatanabe@bdawatson.com",
      password: "Crapton123",
      password_confirmation: "Crapton123",
      admin: true
    )
  end

  context '#create' do 
    it 'creates a new user' do
      # checking if worker created
      expect(User.all.size).to eq 1
    end
  end

end

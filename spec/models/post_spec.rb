require 'rails_helper'

RSpec.describe 'Post' do
	before(:each) do 
	    @new_post = Post.create( 
		    title: "I'm a new post!",
		    content: "Welcome to my development blog.",
		    blog: "development"
	    )
	end

	context '#create' do 

	    it 'creates a new post' do
			# checking if worker created
	        expect(Post.all.size).to eq 1
    	end

    end

end
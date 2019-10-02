require 'rails_helper'

RSpec.describe 'Post' do
	before(:each) do
    @blog = Blog.create(
      title: "Development",
      summary: "Blah."
    )
    @new_post = @blog.posts.create(
	    title: "I'm a new post!",
	    content: "Welcome to my development blog."
    )
	end

	context '#create' do
    it 'creates a new post' do
		# checking if post created
        expect(Post.all.size).to eq 1
  	end

  	it "errs if title is empty" do
  		@new_post.title = nil
  		expect(@new_post).to_not be_valid
  	end

  	it "errs if content is empty" do
  		@new_post.content = nil
  		expect(@new_post).to_not be_valid
  	end
  end

  it 'responds to #blog' do
    expect(@new_post).to respond_to(:blog)
  end
end

require 'rails_helper'

RSpec.describe 'Blog' do
  before(:each) do
    @blog = Blog.create(
      title: "Main",
      summary: "This is my main blog."
    )
  end

  context '#create' do
    it 'expects a new blog to be created' do
      expect(Blog.all.size).to eq(1)
    end
  end

  it 'errs when title is empty' do
    @blog.title = nil
    expect(@blog).to_not be_valid
  end

  it 'errs when summary is empty' do
    @blog.summary = nil
    expect(@blog).to_not be_valid
  end

  it 'responds to #posts' do
    expect(@blog).to respond_to(:posts)
  end

  it 'responds to #banner' do
    expect(@blog).to respond_to(:banner)
  end

  it 'attaches an banner' do
    @blog.banner.attach(io: File.open(fixture_path + '/Headshot.png'), filename: 'Headshot.png', content_type: 'image/png')
    expect(@blog.banner).to be_attached
  end
end

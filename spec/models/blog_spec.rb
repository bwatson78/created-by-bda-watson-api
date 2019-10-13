# frozen_string_literal: true

require 'rails_helper'
require './spec/helpers/blog_spec_helpers'

RSpec.configure do |c|
  c.include BlogHelpers
end

RSpec.describe 'Blog' do
  before(:each) do
    @blog = new_blog
  end

  it 'expects a new blog to be created' do
    expect(Blog.all.size).to eq(1)
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
    attach_banner
    expect(@blog.banner).to be_attached
  end
end

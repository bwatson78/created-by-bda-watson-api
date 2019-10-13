# frozen_string_literal: true

module BlogHelpers
  def new_blog
    @blog = Blog.create(
      title: 'Main',
      summary: 'This is my main blog.'
    )
  end

  def attach_banner
    @blog.banner.attach(
      io: File.open(fixture_path + '/Headshot.png'),
      filename: 'Headshot.png',
      content_type: 'image/png'
    )
  end
end

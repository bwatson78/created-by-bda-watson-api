# frozen_string_literal: true

module UserHelpers
  def new_user
    User.create(
      email: 'edwatanabe@bdawatson.com',
      password: 'Crapton123456789',
      password_confirmation: 'Crapton123456789',
      admin: true
    )
  end

  def new_user_pass_empty
    User.new(
      email: 'edwatanabe@bdawatson.com',
      password: '',
      password_confirmation: 'Crapton123456789',
      admin: true
    )
  end

  def new_user_pass_conf_empty
    User.new(
      email: 'edwatanabe@bdawatson.com',
      password: 'Crapton123456789',
      password_confirmation: '',
      admin: true
    )
  end

  def request_user
    get "/users/#{@user.id}"
  end

  def parsed_body
    @body = JSON.parse(response.body)
  end

  def attach_image
    @new_user.headshot.attach(
      io: File.open(fixture_path + '/Headshot.png'),
      filename: 'Headshot.png',
      content_type: 'image/png'
    )
  end
end

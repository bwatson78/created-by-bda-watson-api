# frozen_string_literal: true

# Main Application Controller and it's Global Options
class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  require 'json_web_token'

  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find_by_id_and_admin(@decoded[:user_id], true)
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end

# frozen_string_literal: true

# Provides actions for Authentication API routes
class AuthenticationController < ApplicationController
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      time = Time.now + 24.hours.to_i
      render json: {
        token: tokenize,
        exp: time.strftime('%m-%d-%Y %H:%M')
      }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end

  def tokenize
    JsonWebToken.encode(user_id: @user.id)
  end
end

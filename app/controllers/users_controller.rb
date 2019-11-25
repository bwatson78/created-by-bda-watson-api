# frozen_string_literal: true

# Provides actions for User API routes
class UsersController < ApplicationController
  before_action :authorize_request, only: :show

  def show
    @user = User.find_by_id(params[:id])
    if @user
      render json: UserSerializer.new(@user).as_json
    else
      render json: {error: 'User not found.', status: 401}, status: 401
    end
  end

  def brads_deets
    @user = User.find_by_email(ENV['BRADS_EMAIL'])
    render json: BradDeetsSerializer.new(@user).as_json
  end
end

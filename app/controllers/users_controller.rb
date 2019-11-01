# frozen_string_literal: true

# Provides actions for User API routes
class UsersController < ApplicationController
  before_action :authorize_request, only: :show

  def show
    @user = User.find(params[:id])
    render json: @user.as_json.merge(social_sites: @user.social_sites.as_json)
  end

  def brads_deets
    @user = User.find_by_email('brad.watson.orlando@gmail.com')
    render json: UserSerializer.new(@user).as_json
  end
end

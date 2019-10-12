# frozen_string_literal: true

# Provides actions for User API routes
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render json: @user.as_json.merge(social_sites: @user.social_sites.as_json)
  end
end

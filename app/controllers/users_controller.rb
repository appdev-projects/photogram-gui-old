class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    render json: User.find_by(username: params.fetch(:username))
  end

  def own_photos
    render json: User.find_by(username: params.fetch(:username)).own_photos
  end
end

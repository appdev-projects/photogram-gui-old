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

  def liked_photos
    render json: User.find_by(username: params.fetch(:username)).liked_photos
  end

  def feed
    render json: User.find_by(username: params.fetch(:username)).feed
  end

  def discover
    render json: User.find_by(username: params.fetch(:username)).discover
  end
end

class PhotosController < ApplicationController
  def show
    render json: Photo.find(params.fetch(:id))
  end

  def comments
    render json: Photo.find(params.fetch(:id)).comments
  end
end

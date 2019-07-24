class PhotosController < ApplicationController
  def show
    render json: Photo.find(params.fetch(:id))
  end
end

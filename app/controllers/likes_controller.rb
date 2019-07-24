class LikesController < ApplicationController
  def create
    Like.create fan_id: params.fetch(:input_user_id), photo_id: params.fetch(:input_photo_id)

    render json: "Created"
  end
end

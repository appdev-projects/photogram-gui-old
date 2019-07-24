class LikesController < ApplicationController
  def create
    Like.create fan_id: params.fetch(:input_user_id), photo_id: params.fetch(:input_photo_id)

    render json: "Created"
  end

  def destroy
    Like.find(params.fetch(:id)).destroy

    render json: "Deleted"
  end
end

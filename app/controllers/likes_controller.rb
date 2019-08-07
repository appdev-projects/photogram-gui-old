class LikesController < ApplicationController
  def index
    likes = Like.all.order({ :created_at => :asc })

    render({ :json => likes.as_json })
  end

  def show
    the_id = params.fetch(:pg_like_id)
    like = Like.where({ :id => the_id }).at(0)

    render({ :json => like.as_json })
  end

  def create
    like = Like.new
    like.fan_id = params.fetch(:qs_fan_id, nil)
    like.photo_id = params.fetch(:qs_photo_id, nil)
    like.save
    
    render({ :json => like.as_json })
  end

  def update
    the_id = params.fetch(:pg_like_id)
    like = Like.where({ :id => the_id }).at(0)
    like.fan_id = params.fetch(:qs_fan_id, nil)
    like.photo_id = params.fetch(:qs_photo_id, nil)
    like.save
    
    render({ :json => like.as_json })
  end

  def destroy
    like = Like.find(params.fetch(:pg_like_id)).destroy
    like.destroy

    render({ :json => like.as_json })
  end
end

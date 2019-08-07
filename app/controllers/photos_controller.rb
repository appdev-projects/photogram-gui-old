class PhotosController < ApplicationController
  def index
    photos = Photo.all.order({ :owner_id => :asc })

    render({ :json => photos.as_json })
  end

  def show
    the_id = params.fetch(:pg_photo_id)
    photo = Photo.where({ :id => the_id }).at(0)

    render({ :json => photo.as_json })
  end

  def create
    photo = Photo.new

    photo.owner_id = params.fetch(:qs_owner_id, nil)
    photo.caption = params.fetch(:qs_caption, nil)
    photo.image = params.fetch(:qs_image, nil)
    photo.likes_count = params.fetch(:qs_likes_count, 0)
    photo.comments_count = params.fetch(:qs_comments_count, 0)
    
    photo.save

    render({ :json => photo.as_json })
  end

  def update
    the_id = params.fetch(:pg_photo_id)
    photo = Photo.where({ :id => the_id }).at(0)


    photo.owner_id = params.fetch(:qs_owner_id, photo.owner_id)
    photo.caption = params.fetch(:qs_caption, photo.caption)
    photo.image = params.fetch(:qs_image, photo.image)
    photo.likes_count = params.fetch(:qs_likes_count, photo.likes_count)
    photo.comments_count = params.fetch(:qs_comments_count, photo.comments_count)
    
    photo.save

    render({ :json => photo.as_json })
  end

  def destroy
    the_id = params.fetch(:pg_photo_id)
    photo = Photo.where({ :id => the_id }).at(0)

    photo.destroy

    render({ :json => photo.as_json })
  end
 
  def comments
    the_id = params.fetch(:pg_photo_id)
    photo = Photo.where({ :id => the_id }).at(0)

    render({ :json => photo.comments.as_json })
  end

  def likes
    the_id = params.fetch(:pg_photo_id)
    photo = Photo.where({ :id => the_id }).at(0)

    render({ :json => photo.likes.as_json })
  end

  def fans
    the_id = params.fetch(:pg_photo_id)
    photo = Photo.where({ :id => the_id }).at(0)

    render({ :json => photo.fans.as_json })
  end

end

class CommentsController < ApplicationController
  def index
    comments = Comment.all.order({ :created_at => :asc })

    render({ :json => comments.as_json })
  end

  def show
    the_id = params.fetch(:pg_comment_id)
    comment = Comment.where({ :id => the_id }).at(0)

    render({ :json => comment.as_json })
  end

  def create
    comment = Comment.new

    comment.author_id = params.fetch(:qs_author_id, nil)
    comment.photo_id = params.fetch(:qs_photo_id, nil)
    comment.body = params.fetch(:qs_body, nil)
    
    comment.save

    render({ :json => comment.as_json })
  end

  def update
    the_id = params.fetch(:pg_comment_id)
    comment = Comment.where({ :id => the_id }).at(0)

    comment.author_id = params.fetch(:qs_author_id, comment.author_id)
    comment.photo_id = params.fetch(:qs_photo_id, comment.photo_id)
    comment.body = params.fetch(:qs_body, comment.body)

    comment.save

    render({ :json => comment.as_json })
  end

  def destroy
    the_id = params.fetch(:pg_comment_id)
    comment = Comment.where({ :id => the_id }).at(0)

    comment.destroy

    render({ :json => comment.as_json })
  end
 
end

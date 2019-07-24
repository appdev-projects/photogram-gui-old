class CommentsController < ApplicationController
  def update
    comment = Comment.find(params.fetch(:id))

    comment.body = params.fetch(:input_body)
    
    comment.save

    render json: "Updated"
  end
end

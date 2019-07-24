class ApplicationController < ActionController::Base
  def show
    render json: User.all
  end
end

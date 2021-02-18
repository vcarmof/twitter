class LikesController < ApplicationController
  def index
  end

  def new
    @like = Like.new
  end

  def create
    @like = Like.new(like_params)
    @like.user_id = current_user.id

    @like.save
  end

  def update
  end

  def destroy
  end


  private
  def like_params
    params.require(:like).permit(:like, :tweet_id)
  end
end

class LikesController < ApplicationController
  def index
  end

  def new
    @like = Like.new
  end

  def create
    params[:like][:user_id] = current_user.id
    @like = like.new(likes_params)
    if @like.save
      redirect_to root_path
    end
    

   
  end

  def update
  end

  def destroy
  end


  private
  def like_params
    params.require(:like).permit(:like, :tweet_id, :user_id)
  end
end

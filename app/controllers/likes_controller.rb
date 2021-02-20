class LikesController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :edit, :update, :destroy, :create]
 

  def create

   @nuevo = Like.find_by(tweet_id: params[:tweet_id], user_id: params[:user_id])
  
  
    if !@nuevo.present?
      @like = Like.new()
      @like.tweet_id = params[:tweet_id]
      @like.user_id = params[:user_id]
      @like.save
    end
      
   
   redirect_to root_path
   
  end

 
def destroy
  @like = Like.find_by(tweet_id: params[:tweet_id], user_id: params[:user_id])
  
  @like.destroy
  redirect_to root_path
  
end

  private
  def like_params
    params.require(:like).permit(:like, :tweet_id, :user_id)
  end
end




class LikesController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :edit, :update, :destroy, :create]
 

  def create

   #@like = Like.find_by(user_id: params[:user_id], tweet_id: params[:tweet_id])

   @nuevo = Like.find_by(
     tweet_id: params[:tweet_id],
     user_id: params[:user_id]
   )
  
  
    if @nuevo.present?
          @nuevo.destroy
        
      
    else
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



def create_xd
  @verificacion = Like.find_by(
    tweet_id: params[:id_tweet],
    user_id: params[:id_user])

  if @verificacion.present?
    @verificacion.destroy
    redirect_to i_tweets_path
  else
    @like = Like.new()
    @like.tweet_id = params[:id_tweet]
    @like.user_id = params[:id_user]
    @like.save
    redirect_to i_tweets_path
  end
end
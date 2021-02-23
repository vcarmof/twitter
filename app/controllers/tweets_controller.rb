class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :edit, :update, :destroy, :retweet, :show_user]
  before_action :set_tweet, only: %i[ show edit update destroy retweet  ]

  # GET /tweets or /tweets.json
  def index

    @tweets = Tweet.tweets_for_me(list_friends()).order(created_at: :DESC).page params[:page]
  
    if params[:q] #REEMPLAZA A RANSACK PARA BUSCAR
      @tweets = Tweet.where('content LIKE ?', "%#{params[:q]}%").order(created_at: :DESC).page params[:page]

    end
  
  #SOLO APARECERÁN LOS TWEETS A LOS QUE SIGUE EL CURREN USER
   #@tweets = Tweet.tweets_for_me(list_friends()).order(created_at: :DESC).page params[:page]
   #@tweets = Tweet.order(created_at: :DESC).page params[:page]
  
   
   @tweet = Tweet.new
    
  end

 

  def retweet
    @ret = Tweet.new
    
    @ret.content = @tweet.content
    @ret.user_id = current_user.id
    @ret.tweet_id = @tweet.id
    @ret.created_at = DateTime.now
    @ret.updated_at = DateTime.now

  

   
   
  

    respond_to do |format|
      if @ret.save
        format.html { redirect_to root_path, notice: "Tweet was successfully created." }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end


    
def show_user
  @users = User.all
end

    



  # GET /tweets/1 or /tweets/1.json
  def show
   @likes = Like.where(tweet_id: @tweet)
  end
   
   

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id

  

   
   
  

  
   
   


    


    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_path, notice: "Tweet was successfully created." }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end



  def list_friends ()
    if user_signed_in?
      friends = Friend.where(user_id: current_user.id )
      list = []
      friends.each do |friend|
          list.push(friend.friend_id)

      end
    end
    return list

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:content, :user_id, :tweet_id)
    end
end

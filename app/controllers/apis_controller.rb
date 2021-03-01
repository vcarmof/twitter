class ApisController < ApplicationController
    #include ActionController::HttpAuthentication::Basic::ControllerMethods
    #http_basic_authenticate_with name: "prueba", password: "pass", only: :create

    def index
        @tweets = Tweet.all.order(created_at: :DESC)
        render json: @tweets.to_json(only: [:id, :content, :user_id, :tweet_id])
    end


    def date
        @tweets = Tweet.all.order(created_at: :DESC)
        filter = []
        @tweets.each do |tweet|
            if tweet.created_at >= params[:date_1] && tweet.created_at <= params[:date_2]
                filter.push(tweet)
            end
        end

        render json: filter.to_json(only: [:id, :content, :user_id, :tweet_id])

    end


    def create
        @tweet = Tweet.new(tweet_params())
        if @tweet.save
            redirect_to api_news_path
        end
    end

    private
    def tweet_params
        params.require(:tweet).permit(:content)
      end
end
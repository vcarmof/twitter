class ApisController < ApplicationController
    include ActionController::HttpAuthentication::Basic::ControllerMethods
    http_basic_authenticate_with name: "prueba", password: "pass" #, except: :index

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

        render json: filter.to_json

    end
end
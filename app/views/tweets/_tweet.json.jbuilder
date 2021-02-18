json.extract! tweet, :id, :content, :retweet, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)

module TweetsHelper

   def rt_count (tweet)
     Tweet.where(tweet_id: tweet).count 
   end

   def like_count(tweet)
    tweet.likes.count
   end


  
   

 

end

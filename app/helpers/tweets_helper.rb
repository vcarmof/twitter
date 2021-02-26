module TweetsHelper

   def rt_count (tweet)
     Tweet.where(tweet_id: tweet).count 
   end

   def like_count(tweet)
    tweet.likes.count
   end


   def to_hashtag(tweet)
    tweet.content.gsub(/#\w+/){|w|  link_to w, "/?utf8=✓&q=#{w.gsub("#", '')}&commit=Buscar+tweets"}.html_safe
   end
            
      
          
    


  
   

 

end

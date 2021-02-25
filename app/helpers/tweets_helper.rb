module TweetsHelper

   def rt_count (tweet)
     Tweet.where(tweet_id: tweet).count 
   end

   def like_count(tweet)
    tweet.likes.count
   end


  #  def array_hash(content)
  #       array = content.split(" ")
  #       final = []
  #       array.each do |w|
  #         if w[0].include?("#")
  #           final.push( )
  #         end
  #       end 
  #     end
            
      
          
    


  
   

 

end

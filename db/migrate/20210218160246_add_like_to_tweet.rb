class AddLikeToTweet < ActiveRecord::Migration[5.2]
  def change
    add_reference :tweets, :like, foreign_key: true
  end
end

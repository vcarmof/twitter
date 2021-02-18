class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :content
      t.boolean :retweet

      t.timestamps
    end
  end
end

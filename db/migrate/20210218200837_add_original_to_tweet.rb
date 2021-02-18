class AddOriginalToTweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :original, :string
  end
end

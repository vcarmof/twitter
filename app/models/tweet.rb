class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :tweets

    validates :content, presence: true

    paginates_per 50


   
   scope :tweets_for_me, ->(list) {where(user_id: list)}
   


    
    

    

    
   
end

class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :tweets

    validates :content, presence: true


    

    
   
end

class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes
    has_many :tweets

    validates :content, presence: true

    
   
end

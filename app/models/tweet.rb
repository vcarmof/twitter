class Tweet < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :tweets

    validates :content, presence: true

    paginates_per 50


    

    
   
end

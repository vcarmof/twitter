class Friend < ApplicationRecord
    belongs_to :user
    has_many :friends
end

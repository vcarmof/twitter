class Tweet < ApplicationRecord
    belongs_to :user
    belongs_to :like
end

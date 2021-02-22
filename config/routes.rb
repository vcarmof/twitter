Rails.application.routes.draw do
  
 

 

 
  resources :tweets do
    member do
      get 'retweet', to: 'tweets#retweet', as: 'retweet'
    end
  end 

  get 'tweet/:user_id/:tweet_id/like', to: 'likes#create', as: 'likes'
  delete 'tweet/:user_id/:tweet_id/like', to: 'likes#destroy', as: 'likes_destroy'

  get 'friend/:current_id/:friend_id', to: 'friends#create', as: 'friends_follow'


  

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "tweets#index"
end

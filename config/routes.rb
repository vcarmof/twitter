Rails.application.routes.draw do
  
 

 

  get 'friend/index'
  get 'friend/new'
  get 'friend/create'
  get 'friend/destroy'
  resources :tweets do
    member do
      get 'retweet', to: 'tweets#retweet', as: 'retweet'
    end
  end 

  get 'tweet/:user_id/:tweet_id/like', to: 'likes#create', as: 'likes'
  delete 'tweet/:user_id/:tweet_id/like', to: 'likes#destroy', as: 'likes_destroy'

  

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "tweets#index"
end

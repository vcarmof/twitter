Rails.application.routes.draw do
  get 'like/index'
  get 'like/new', to: 'like#new'
  post 'like', to: 'like#create'
 
  post 'like/update'
  get 'like/destroy'

  put 'tweet/:id/like', 'tweet#like', as: 'like'

  resources :tweets do
    member do
      get :retweet
      post :retweet
    end
  end 

  

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "tweets#index"
end

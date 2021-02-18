Rails.application.routes.draw do
  get 'like/index'
  get 'like/new'
  get 'like/update'
  get 'like/destroy'
  resources :tweets
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "tweets#index"
end

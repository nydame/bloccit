Rails.application.routes.draw do
  # resources :topics
  # resources :posts
  resources :topics do
      resources :posts, except: [:index]
  end

  resources :users, only: [:new, :create]

  get 'about' => 'welcome#about'
  post 'users/confirm' => 'users#confirm'
  root 'welcome#index' #same as root({to: 'welcome#index'})
 end

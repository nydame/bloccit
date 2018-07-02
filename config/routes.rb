Rails.application.routes.draw do
  resources :questions
  resources :posts
  get 'about' => 'welcome#about'
  root 'welcome#index' #same as root({to: 'welcome#index'})
 end

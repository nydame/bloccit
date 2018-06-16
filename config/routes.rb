Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/contact'
  root 'welcome#index' #same as root({to: 'welcome#index'})
 end

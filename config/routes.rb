Rails.application.routes.draw do
  get 'my_stocks', to: 'users#my_stocks'

  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
end

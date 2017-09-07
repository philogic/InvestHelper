Rails.application.routes.draw do
  resources :user_stocks
  get 'stocks/search'

  get 'my_stocks', to: 'users#my_stocks'
  get 'search_stocks', to: 'stocks#search'

  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
end

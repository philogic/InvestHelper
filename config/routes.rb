Rails.application.routes.draw do
  devise_for :users
  resources :user_stocks, except: %i[show edit update]
  get 'stocks/search'

  get 'my_stocks', to: 'users#my_stocks'
  get 'search_stocks', to: 'stocks#search'


  get 'welcome/index'
  root 'welcome#index'
end

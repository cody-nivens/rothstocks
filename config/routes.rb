Rails.application.routes.draw do

  resources :dividend_ranks
  resources :holdings

  resources :portfolios
  resources :holdings
  resources :stocks
  resources :industries
  resources :sectors
  get 'welcome/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/stocks/list', to: 'stocks#list', as: 'stock_list'
  get '/', to: 'welcome#index', as: 'home'
  get '/faq', to: 'application#faq', as: 'faq'
  get '/secret', to: 'application#secret', as: 'secret'
  get '/about', to: 'application#about', as: 'about'
  get '/contact', to: 'application#contact', as: 'contact'
end

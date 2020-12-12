Rails.application.routes.draw do

  # topPage
  root 'tops#index'
  get 'tops/index'

  # session関連
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # user関連
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

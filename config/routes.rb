Rails.application.routes.draw do

  # topPage
  root 'tops#index'
  get 'tops/index'

  # session関連
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # ＋SNSログイン
  get 'auth/:provider/callback', to: 'sessions#create'

  # user関連
  resources :users

  # petsitter関連
  resources :petsitters

  # review関連
  resources :reviews

end

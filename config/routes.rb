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
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get 'users/auth/google_oauth2/callback', to: 'sessions#create'

  # user関連
  resources :users

  # petsitter関連
  resources :petsitters do
    # like(いいね)関連
    resources :likes, only: [:create, :destroy]
    # temp_save(一時保存)関連
    resources :temp_saves, only: [:create, :destroy]
  end

  get 'users/:id/histories', to: 'users#histories', as: 'user_histories'
  get 'users/:id/clips', to: 'users#clips', as: 'user_clips'
  get 'petsitters/:id/details', to: 'petsitters#details', as: 'petsitter_details'
  get 'petsitters/:id/reviews', to: 'petsitters#reviews', as: 'petsitter_reviews'
  get 'petsitters/:id/reviews/new', to: 'petsitters#postReviews', as: 'petsitter_new_reviews'
  get 'petsitters/:id/map', to: 'petsitters#map', as: 'petsitter_map'
  get 'petsitters/:id/reviewsample', to: 'petsitters#reviewsample', as: 'petsitter_reviewsample'

  # review関連
  resources :reviews, only: [:create, :edit, :update, :destroy]

end

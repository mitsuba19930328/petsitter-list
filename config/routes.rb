Rails.application.routes.draw do
  root 'tops/index'
  get 'tops/index'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

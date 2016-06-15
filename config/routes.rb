Rails.application.routes.draw do
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server_error'

  root 'home#index'
  resources :users, only: [:create, :show]
  get 'not_visible', to: 'home#not_visible'
end

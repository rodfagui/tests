Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :arrays_numbers
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end

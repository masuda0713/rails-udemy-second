Rails.application.routes.draw do
  # get 'users/index'
  get 'users', to: 'users#index'
  resources :questions
end

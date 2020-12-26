Rails.application.routes.draw do
  resources :users, only: [:new, :create] do
    resources :users, only: [:new, :create]
  end

  get 'users/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

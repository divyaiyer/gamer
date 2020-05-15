Rails.application.routes.draw do
  resources :albums,only: [:new, :create]
  resources :plays,only:[:index,:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'albums#new'
    get 'play', to: 'plays#index'
end

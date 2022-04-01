Rails.application.routes.draw do
  devise_for :users
  scope "(:locale)", locale: /en|fr/ do
    root to: 'pages#home'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :eats, only: [:index, :show, :edit, :update]
    resources :sleeps, only: [:index, :show, :edit, :update] do
      resources :requests, only: [:new, :create]
    end
    resources :cares, only: [:index, :show, :edit, :update]
    resources :requests, only: [:index, :edit, :update]
  end
end

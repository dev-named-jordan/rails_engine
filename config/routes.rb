Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        resources :find, only: [:index], controller: :merchant_search
      end
      namespace :items do
        resources :find_all, only: [:index], controller: :items_search
      end
      resources :merchants, only: [:index, :show] do
        resources :items, only: [:index]
      end
      resources :items
      get "/items/:id/merchant", to: 'items/merchant#index'
    end
  end
end

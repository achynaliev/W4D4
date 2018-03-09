Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resource :session, only: [:new, :destroy, :create]
  resources :bands do
    # resources :albums, except: [:edit] do
    resources :albums, only: [:create, :destroy, :new, :update] do
      resources :tracks, only: [:create, :destroy, :new, :update]
    end
  end

  resources :albums, only: [:edit, :show, :index]
  resources :tracks, only: [:edit, :show, :index]
end

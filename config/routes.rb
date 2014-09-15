Time2learn::Application.routes.draw do
  devise_for :users

  root :to => 'home#index'

  namespace :admin, module: 'admin', defaults: {format: :json} do
    resources :data, only: [:show, :index, :destroy, :update]
    devise_for :users, only: [:registrations, :sessions]
  end
end

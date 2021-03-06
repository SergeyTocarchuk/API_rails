# require 'api_constraints'

Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    scope module: :v1 do
      resources :users, :only => [:show, :create, :update, :destroy] do
        resources :products, :only => [:create, :update, :destroy]
      end
      resources :sessions, :only => [:create, :destroy]
      resources :products, :only => [:index, :show]
    end
  end

  # namespace :api, defaults: { format: :json },
  #                             constraints: { subdomain: 'api' }, path: '/' do
  #   scope module: :v1,
  #           constraints: ApiConstraints.new(version: 1, default: true) do
  #     resources :users, :only => [:show]
  #   end
  # end
end

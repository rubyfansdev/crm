Rails.application.routes.draw do
  devise_for :users
  resources :workspaces
  root "workspaces#index"
end

Rails.application.routes.draw do
  devise_for :users
  resources :workspaces do
    resources :task_lists
  end
  root "workspaces#index"
end

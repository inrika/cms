Rails.application.routes.draw do
  devise_for :admins
  root 'welcome#index'
  resources :pages, only: [:show]
  namespace :admin do
    resources :pages
    resources :templates
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

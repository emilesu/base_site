Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :account do
    resources :projects do
      resources :posts
    end
  end

  namespace :admin do
    resources :projects
  end

  root "welcome#index"
end

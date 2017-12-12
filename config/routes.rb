Rails.application.routes.draw do
  resources :courses do
    resources :assignments
  end

  resources :grades
  resources :photos

  devise_for :users, path: 'users', controllers: { sessions: 'users/sessions' }
  resources :users, only: [:show]
  devise_for :admins, path: 'admins', controllers:
  { sessions: 'admins/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  post 'courses/:id/', to: 'courses#register'
  get 'courses/:id/assignments', to: 'courses#assignments'
end

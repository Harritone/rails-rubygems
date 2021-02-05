Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :edit, :show, :update]
  resources :courses
  root 'static_pages#landing_page'
  get 'privacy_policy', to: 'static_pages#privacy_policy'
  get 'activity', to: 'static_pages#activity'
end

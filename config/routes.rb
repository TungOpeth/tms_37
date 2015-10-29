Rails.application.routes.draw do

  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  namespace :supervisor do
    resources :subjects
  end
  resources :subjects, only: [:index, :show]
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get   'users/:id' => 'users#show', as: 'user'
  get   'users'  => 'users#index'
end

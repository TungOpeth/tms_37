Rails.application.routes.draw do

  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'


  resources :courses, only: [:index, :show] do
    resources :subjects, only: [:index, :show, :update]
  end
  resources :tasks
  resources :user_tasks
  resources :user_subjects
  namespace :supervisor do
    resources :courses
    resources :subjects
  end
  resources :subjects, only: [:index, :show]
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users
end

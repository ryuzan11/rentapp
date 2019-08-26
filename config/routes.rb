Rails.application.routes.draw do

  get 'likes/create'
  get 'likes/destroy'
  root 'rent_houses#index'

  devise_for :users,
   only: [:registrations, :sessions, :passwords],
   controllers: {
    registrations:  'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    get 'login' => 'users/sessions#new'
    get 'sign_up' => 'users/registrations#new'
    get 'edit' => 'users/registrations#edit'
    delete 'logout' => 'users/sessions#destroy'
  end

  resources :users, only: [:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rent_houses do
    collection do
      get 'get_cities'
    end
    resources :comments, only: [:create, :destroy]
  end

  resources :likes, only: [:create, :destroy]

end

Rails.application.routes.draw do

  root 'users#index'

  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions',
   :passwords => 'users/passwords'
  }

  devise_scope :user do
    get 'login' => 'users/sessions#new'
    get 'sign_up' => 'users/registrations#new'
    get 'edit' => 'users/registrations#edit'
    delete 'logout' => 'users/sessions#destroy'
  end

  resources :users, :only => [:show, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do


  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=begin
  devise_for :users, :path  => '/users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
=end
  #devise_scope :user do
  #   get   '/users/sign_in'  => 'users/sessions#new',  as: :new_user_session
  #end
  devise_for :users, path: "", controllers: { sessions: "users/sessions", registrations: "registrations" }, path_names: { sign_in: 'login', password: 'forgot', confirmation: 'confirm', unlock: 'unblock', sign_up: 'register', sign_out: 'signout'}


  resources :users

  root "static_pages#about"
  match 'about_us', to: 'static_pages#about', via: :get
  match 'team', to: 'static_pages#team', via: :get
  match 'contact_us', to: 'static_pages#contact_us', via: :get
end

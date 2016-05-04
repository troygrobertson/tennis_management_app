Rails.application.routes.draw do
  get 'static_pages/about'

  #resources :users

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "static_pages#about"
  match 'about_us', to: 'static_pages#about', via: :get
  match 'team', to: 'static_pages#team', via: :get
  match 'contact_us', to: 'static_pages#contact_us', via: :get
end

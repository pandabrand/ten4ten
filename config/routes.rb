Ten4ten::Application.routes.draw do
  get "images/new"

  get "albums/new"

  get "users/new"

  root to: 'static_pages#home'
  
  devise_for :users
  
  #devise_for :users, :path => "auth", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'cmon_let_me_in' }

  devise_scope :user do
    match "/signup" => "devise/registrations#new"
    match "/login" => "devise/sessions#new"
    match "signout" => "devise/sessions#destroy"
  end

  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
end

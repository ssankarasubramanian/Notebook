Rails.application.routes.draw do
  
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  devise_for :users
  get 'welcome/index'
  
  resources :notes
  
  authenticated :user do
    root 'notes#index', as: "authenticated_root"
    resources :categorizations, except: [:index]
  end
  
  root 'welcome#index'

end

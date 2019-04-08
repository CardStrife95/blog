Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :accounts

  resources :articles do
    resources :commentaires
  end

  root 'welcome#index'
end

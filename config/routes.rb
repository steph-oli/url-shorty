Rails.application.routes.draw do
  resources :urls
  root :to => redirect('/urls/new')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

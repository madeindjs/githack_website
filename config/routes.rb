Rails.application.routes.draw do
  resources :repositories, only: %i[index new create destroy show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

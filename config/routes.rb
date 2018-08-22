Rails.application.routes.draw do
  resources :repositories, only: %i[index new create destroy show] do
    resources :leaks, only: %i[update]
  end

  match 'import_repositories', to: 'repositories#import', via: %i[get post]
  get 'random_repository' => 'repositories#random'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'repositories#index'
end

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "main#index"

  get 'get_categories'       => 'categories#get_categories'
  resources :request,   only: [:index]
  resources :education, only: [:index]
  resources :search,    only: [:index]
  resources :main,      only: [:index]

  resources :categories do
    resources :competencies do
      resources :skills do
        resources :sub_skills
      end
    end
  end
end

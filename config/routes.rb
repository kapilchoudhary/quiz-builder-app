Rails.application.routes.draw do
  root 'quizzes#index'
  resources :quizzes
  devise_scope :user do
    get "users", to: "devise/sessions#new"
  end

  devise_for :users
end

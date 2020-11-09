Rails.application.routes.draw do
  resources :testes
  devise_for :users,
  path: '/', # optional namespace or empty string for no space
  path_names: {
    sign_in: 'login',
    sign_out: 'sair',
    password: 'senha',
    confirmation: 'confirmar',
    registration: 'registrar',
    sign_up: 'cadastrar'
  }

  root 'home#index'

  get '/pacientes', as: :patients, to: 'patients#index'
  get '/pacientes/:id', as: :patient, to: 'patients#show'
  # get 'perfil', as: :user,  to: 'users#edit'
  # patch 'perfil', as: :user,  to: 'users#update'

  resources :exams, path: :exames

  resources :users, only: [:edit, :update]

  namespace :api do
    resources :exams
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

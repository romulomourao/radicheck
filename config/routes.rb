Rails.application.routes.draw do
  devise_for :users,
  path: '', # optional namespace or empty string for no space
  path_names: {
    sign_in: 'login',
    sign_out: 'sair',
    password: 'secret',
    confirmation: 'verification',
    registration: 'register',
    sign_up: 'cadastrar'
  }

  root 'home#index'

  get '/pacientes', as: :patients, to: 'patients#index'
  get '/pacientes/:id', as: :patient, to: 'patients#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

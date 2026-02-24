Rails.application.routes.draw do
  devise_for :users, path: "secure" # Em vez de aparecer/users/sign_in vai aparecer /secure/sign_in (As rotas no programa continuam igual, so muda no navegador)

  get "/home", to: "pages#home" # Ambos levam para pages_controller mas dentro de cada def
  get "/about", to: "pages#about"
  # Defines the root path route ("/")

  namespace :api do
    namespace :v1 do
      post :auth, to: "auth#create"
      resources :entries
    end
  end

  resources :entries
  root "entries#index" # Define a primeira página a ser mostrada no projeto
end

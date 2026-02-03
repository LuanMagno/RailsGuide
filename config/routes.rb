Rails.application.routes.draw do
  get "/home", to: "pages#home" # Ambos levam para pages_controller mas dentro de cada def
  get "/about", to: "pages#about"
  # Defines the root path route ("/")
  root "pages#home" # Define a primeira página a ser mostrada no projeto
end

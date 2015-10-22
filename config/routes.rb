Spree::Core::Engine.add_routes do
  resources :comments, only: [:create]
end

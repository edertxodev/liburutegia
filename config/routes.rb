Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations]
  as :user do # Con esto permitimos modificar aparte la contraseña al usuario
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
    put 'users' => 'devise/registrations#update', :as => 'user_registration'            
  end
  
  resources :users
  resources :libros do
    resources :comentarios
  end
  resources :solicitudes
  resources :leidos
  
  get 'users/:username/perfil' => 'users#mostrar_usuario', as: 'mostrar_usuario'
  get 'users/:id/libros-leidos' => 'leidos#libros_leidos_usuario', as: 'user_libros_leidos'
  get 'users/:id/libros-leidos-usuario' => 'leidos#libros_leidos_mostrar', as: 'libros_leidos_mostrar'
  get 'solicitudes/:id/confirmar' => 'solicitudes#aceptar_solicitud'
  get 'solicitudes/:id/devolver' => 'leidos#devolver_libro'
  get 'solicitudes/devolver' => 'solicitudes#devolver_libro', as: 'devolver_libro'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'libros#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

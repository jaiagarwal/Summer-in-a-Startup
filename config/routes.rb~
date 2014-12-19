Mashup::Application.routes.draw do
  
  resources :startups
  resources :startups do
    member do 
        post 'follow'
        post 'unfollow'
    end
  end

  #get "entrepreneurs/new"
  resources :students
  resources :entrepreneurs
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  #get "students/new"
  root 'logins#home'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/supdatepwd',  to: 'students#updatepwd',            via: 'get'
  match '/eupdatepwd',  to: 'entrepreneurs#updatepwd',            via: 'get'
  match '/sprofile',  to: 'students#profile',            via: 'get'
  match '/sfollowing',  to: 'students#following',            via: 'get'
  match '/allstartups',  to: 'startups#all',            via: 'get'
  match '/allstartups',  to: 'startups#all',            via: 'post'
  match '/allstudents',  to: 'students#all',            via: 'post'
  match '/allstudents',  to: 'students#all',            via: 'get'
  # Sample resource route (maps HTTP verbs to controller actions automatically):
  resource :login do
    member do
      get 'callback'
      get 'logout'
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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

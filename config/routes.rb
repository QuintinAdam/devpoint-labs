DevpointLabs::Application.routes.draw do
  
  resources :admin, only: :index 
  namespace :admin do
    resources :users
  end


  resources :posts


  resources :projects do
    get 'pictures/new', to: 'projects#new_picture', as: :new_picture
    post 'pictures/new', to: 'projects#create_picture', as: :create_picture
  end
  devise_for :users, controllers: {registrations: 'registrations'}


  root :to => 'static_pages#home'
  get "path", to: 'controller#action', as: :name_of_path

  get "web-development", to: "static_pages#web_development", as: :web_development
  get "about", to: "static_pages#about", as: :about
  get "ios-development", to: "static_pages#ios_development", as: :ios_development
  get "utah", to: "static_pages#utah", as: :utah
  get "learn-more", to: "static_pages#learn_more", as: :learn_more
  get "tuition", to: "static_pages#tuition", as: :tuition
  get "faq", to: "static_pages#faq", as: :faq

  # Contact us form
  get "contact-us", to: 'contact#new', as: :contact
  post "contact-us", to: 'contact#create', as: :contact

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

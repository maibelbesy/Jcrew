Rails.application.routes.draw do

  # The main route '/'
  root 'main#home'

  # Routes for the main website (static pages)
  get '/team' => 'main#team', as: :team

  # Routes for the account web pages
  get '/users/edit/:id' => 'account#edit', as: :user_edit
  get '/users/:id' => 'account#show', as: :user
  post '/users/edit/:id' => 'account#update', as: :user_update

  # Routes for the blog
  get '/blog' => 'blog#index', as: :posts
  post '/blog' => 'blog#list', as: :filter_posts
  get '/blog/post/:id' => 'blog#show', as: :post
  get '/blog/new' => 'blog#new', as: :new_post
  get '/blog/edit/:id' => 'blog#edit', as: :edit_post
  post '/blog/edit/:id' => 'blog#update', as: :update_post
  post '/blog/new' => 'blog#create', as: :create_post
  post '/blog/publish' => 'blog#publish', as: :publish_post
  delete '/blog/post/:id'=> 'blog#destroy', as: :delete_post

  post '/blog/post/comment/:id' => 'comments#create', as: :post_comment
  post '/blog/post/reply/comment/:post_id/:comment_id' => 'reply#create', as: :post_reply
  delete '/blog/post/comment/:id' => 'comments#destroy', as: :delete_comment

  # Routes for the session
  get '/register' => 'session#register', as: :register
  post '/register' => 'session#register_user', as: :register_user
  get '/login' => 'session#login', as: :login
  post '/login' => 'session#login_user', as: :login_user
  delete '/logout' => 'session#logout', as: :logout



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

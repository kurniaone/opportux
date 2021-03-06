Opportux::Application.routes.draw do
  # RESQUE
  require 'resque/server'
  # authenticate :admin do
    mount Resque::Server.new, :at => "/admin/resque"
  # end

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :admins, :controllers => {
    :sessions => "sessions"
  }

  devise_for :users, :controllers => {
    :sessions => "sessions",
    :registrations => "registrations",
    :passwords => "passwords",
    :omniauth_callbacks => "omniauth_callbacks"
  }

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  get '/p/:slug' => 'home#show', :as => 'detail'
  get '/p/:slug' => 'home#show', :as => 'home'
  get '/p/:slug/photo/:id' => 'home#photo', :as => 'photo'
  get '/business' => 'home#business', :as => 'business'
  get '/people' => 'home#people', :as => 'people'
  get '/project' => 'home#project', :as => 'project'
  get '/howitworks' => 'home#content', :as => 'howitworks'
  get '/disclaimer' => 'home#content', :as => 'disclaimer'
  get '/policy' => 'home#content', :as => 'policy'
  get '/term' => 'home#content', :as => 'term'
  get '/about-us' => 'home#content', :as => 'about_us'
  get '/faq' => 'home#content', :as => 'faq'
  get '/about' => 'home#about', :as => 'about'
  get '/contact-us' => 'home#contact', :as => 'contact_us'

  resources :home do
    collection do
      get   :photo
      get   :business
      get   :people
    end
  end

  get '/uploads' => 'posts#new', :as => 'new_post'
  get '/p/:slug/edit' => 'posts#edit', :as => 'edit_post'
  get '/p/review/:slug' => 'posts#review', :as => 'review_posts'
  get '/p/publish/:slug' => 'posts#publish', :as => 'publish_posts'
  get '/p/renew/:slug' => 'posts#renew', :as => 'renew_posts'
  get '/p/like/:slug' => 'posts#like', :as => 'like_posts'
  get '/p/report/:slug' => 'posts#report', :as => 'report_posts'

  resources :posts do
    collection do
      get   :report
      get   :like
      get   :renew
      get   :review
      get   :publish
      get   :autocomplete_tag_name
    end
  end


  get '/u/:slug' => 'users#show', :as => "user"
  get '/u/:slug/edit' => 'users#edit', :as => "edit_user"
  put '/u/:slug/update' => 'users#update', :as => "update_user"
  get '/u/:slug/draft' => 'users#draft', :as => "user_draft"

  resources :users, :only => [:show, :edit, :update] do
  end


  # ADMIN #
  get '/admins' => 'Admins::Application#dashboard', :as => 'backend_root'
  get '/admins/dashboard' => 'Admins::Application#dashboard', :as => 'admin_root'
  delete '/admins/:slug/destroy' => 'Admins::Application#destroy', :as => 'admin_remove_post'
  delete '/admins/posts/:slug/destroy' => 'Admins::Posts#destroy', :as => 'admins_posts_remove'

  namespace :admins do
    resources :application, :only => [:index] do
      collection do
        get     :dashboard
        delete  :destroy
      end
    end

    resources :posts, :only => [:index, :destroy]
    resources :advertises
    resources :contents
  end

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

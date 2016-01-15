Rails.application.routes.draw do

  get 'dashboard/index'

  scope "/admin" do
    get '/', to: 'dashboard#index'
    # resources :trails, except: [:index, :show]
  end

  resources :events
  
  # scope ':locale', locale: /en|fr/ do
  #   root to: 'home#land'
  #   get "home/land"
  # end

  # root 'home#land'
  devise_for :users

  scope ':locale', locale: /en|fr/ do
    get 'home/land'
    get 'testimonial/index'
    resources :trails, only: [:index, :show, :new, :create] do
      resources :events, only: [:index, :show, :new, :create]
    end
    get '/', to: 'home#land'
    get "/:id" => "high_voltage/pages#show", :as => :page, :format => false
  end

  root 'home#land'
end

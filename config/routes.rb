Rails.application.routes.draw do

  root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root

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
    root 'home#land'
    get 'testimonial/index'
    resources :profiles
    resources :trails, only: [:index, :show, :new, :create] do
      resources :events, only: [:index, :show, :new, :create]
    end
    get "/:id" => "high_voltage/pages#show", :as => :page, :format => false
  end


  
end

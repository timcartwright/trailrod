Rails.application.routes.draw do


  resources :events
  
  # scope ':locale', locale: /en|fr/ do
  #   root to: 'home#land'
  #   get "home/land"
  # end

  # root 'home#land'
  devise_for :users

  scope ':locale', locale: /en|fr/ do
    get "home/land"
    get 'testimonial/index'
    resources :trails
    get '/', to: 'home#land'
    get "/:id" => "high_voltage/pages#show", :as => :page, :format => false
  end

  root 'home#land'
end

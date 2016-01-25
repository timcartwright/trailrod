Rails.application.routes.draw do

  resources :event_registrations
  root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root

  get 'dashboard/index'

  scope "/admin" do
    get '/', to: 'dashboard#index'
  end

  scope ':locale', locale: /en|fr/ do
    root 'home#land'
    devise_for :users, :path => 'accounts'
    resources :users do
      resources :profiles
    end
    resources :trails, only: [:index, :show, :new, :create] do
      resources :events, only: [:index, :show, :new, :create]
    end
    get "/:id" => "high_voltage/pages#show", :as => :page, :format => false
  end
  
end
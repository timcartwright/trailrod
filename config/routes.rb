Rails.application.routes.draw do

  root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root

  get 'dashboard/index'

  scope "/admin" do
    get '/', to: 'dashboard#index'
  end

  scope ':locale', locale: /en|fr/ do
    root 'home#land'
    devise_for :users, :path => 'accounts'

    resources :users
    resources :profiles
    post 'profiles/load', :to => 'profiles#load'

    resources :trails do
      resources :events, only: [:index, :show, :new, :create] do
        resources :event_registrations
      end
    end

    get "/:id" => "high_voltage/pages#show", :as => :page, :format => false
  end
  
end
Rails.application.routes.draw do

  scope ':locale', locale: /en|fr/ do
    root to: 'home#land'
    get "home/land"
  end

  # root 'home#land'
  devise_for :users
end

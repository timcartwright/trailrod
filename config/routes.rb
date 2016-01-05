Rails.application.routes.draw do


  # scope ':locale', locale: /en|fr/ do
  #   root to: 'home#land'
  #   get "home/land"
  # end

  # root 'home#land'
  devise_for :users

  scope ':locale', locale: /en|fr/ do
    get "home/land"
    get 'testimonial/index'
    get '/', to: 'home#land'
  end

  root 'home#land'
end

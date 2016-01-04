Rails.application.routes.draw do
  root 'home#land'
  devise_for :users
end

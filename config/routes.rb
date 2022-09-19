# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_scope :user do
    get "/user/settings",  to: "user_settings#edit", as: "user_settings"
    put "/user/settings",  to: "user_settings#update", as: ""
    delete "/user/settings", to: "user_settings#destroy", as: ""
  end
  devise_for :users, controllers: { registrations: "registrations" }

  devise_scope :doctor do
    get "/doctor/settings",  to: "doctor_settings#edit", as: "doctor_settings"
    put "/doctor/settings",  to: "doctor_settings#update", as: ""
    delete "/doctor/settings", to: "doctor_settings#destroy", as: ""
  end
  devise_for :doctors, controllers: { registrations: "registrations" }

  root "home#index"
  resources :verifications, only: :create

  resources :doctors, only: %i[index show] do
    resources :appointments, only: %i[new create]
  end

  resources :appointments, only: %i[index show]

  resources :recommendations, only: %i[create]
end

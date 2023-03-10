# frozen_string_literal: true

Rails.application.routes.draw do
  
  root to: 'home#index'
  devise_for :employees
  
  devise_scope :employee do
    get '/employees/sign_out', to: 'devise/sessions#destroy'
  end
 
end

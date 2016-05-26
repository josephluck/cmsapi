require "api_constraints"

CmsApi::Application.routes.draw do
  devise_for :companies
  devise_for :users, controllers: { confirmations: 'confirmations' }
  # Api definition
  namespace :api, defaults: { format: :json },
                              path: '/'  do
    scope module: :v1,
              constraints: ApiConstraints.new(version: 1, default: true) do
      # We are going to list our resources here
      resources :users, :only => [:index, :show, :create, :update, :destroy]
      match '/users/reset_password_email', to:'users#reset_password_email', via: 'post'
      match '/users/reset_password', to:'users#reset_password', via: 'post'

      resources :sessions, :only => [:create, :destroy]
      get '/sessions/:auth_token', to: 'sessions#show'
      match '/sessions', to:'sessions#destroy', via: 'delete'
      resources :companies, :only => [:index, :show, :create, :update, :destroy]
      get '/companies/:id/users', to: 'companies#users'
      get '/companies/:id/projects', to: 'companies#projects'
      resources :team_members, :only => [:index, :create, :update, :destroy]
      resources :projects, :only => [:index, :show, :create, :update, :destroy]
      resources :user_projects, :only => [:index, :show, :create, :update]
      match "/user_projects", to: "user_projects#destroy", via: "delete"

      # CMS specific endpoints
      resources :sites, :only => [:index, :show, :create, :update, :destroy]
      match '/sites/reorder', to: 'sites#reorder', via: "post"

      get '/companies/:id/pages', to: 'companies#pages'

      resources :pages, :only => [:index, :show, :create, :update, :destroy]
      match '/pages/reorder', to: 'pages#reorder', via: "post"
      get '/sites/:site_id/pages', to: 'sites#pages'

      resources :sections, :only => [:index, :show, :create, :update, :destroy]
      match '/sections/reorder', to: 'sections#reorder', via: "post"
      get '/pages/:page_id/sections', to: 'pages#sections'

      resources :items, :only => [:index, :show, :create, :update, :destroy]
      match '/items/reorder', to: 'items#reorder', via: "post"
      get '/sections/:section_id/items', to: 'sections#items'

      resources :fields, :only => [:index, :show, :create, :update, :destroy]

      resources :field_templates, :only => [:index, :show, :create, :update, :destroy]
      match '/field_templates/reorder', to: 'field_templates#reorder', via: "post"

      resources :field_template_attributes, :only => [:index, :show, :create, :update, :destroy]
    end
  end
end
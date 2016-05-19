require "api_constraints"

CmsApi::Application.routes.draw do
  devise_for :companies
  devise_for :users
  # Api definition
  namespace :api, defaults: { format: :json },
                              path: '/'  do
    scope module: :v1,
              constraints: ApiConstraints.new(version: 1, default: true) do
      # We are going to list our resources here
      resources :users, :only => [:index, :show, :create, :update, :destroy]
      resources :sessions, :only => [:create, :destroy]
      get '/sessions/:auth_token', to: 'sessions#show'
      match '/sessions', to:'sessions#destroy', via: 'delete'
      resources :companies, :only => [:index, :show, :create, :update, :destroy]
      get '/companies/:id/users', to: 'companies#users'
      get '/companies/:id/projects', to: 'companies#projects'
      resources :team_members, :only => [:index, :create, :update, :destroy]
      resources :projects, :only => [:index, :show, :create, :update, :destroy]
      resources :user_projects, :only => [:index, :show, :create, :update]
      # When users are removed from projects the params contain the user id and project id
      # Not the associated id, hence why match is needed.
      match "/user_projects", to: "user_projects#destroy", via: "delete"

      # CMS specific endpoints
      resources :sites, :only => [:index, :show, :create, :update, :destroy]
      match '/sites/reorder', to: 'sites#reorder', via: "post"

      get '/companies/:id/pages', to: 'companies#pages'

      resources :pages, :only => [:index, :show, :create, :update, :destroy]
      get '/sites/:site_id/pages', to: 'sites#pages'

      resources :sections, :only => [:index, :show, :create, :update, :destroy]
      get '/pages/:page_id/sections', to: 'pages#sections'

      resources :items, :only => [:index, :show, :create, :update, :destroy]
      get '/sections/:section_id/items', to: 'sections#items'

      resources :fields, :only => [:index, :show, :create, :update, :destroy]
      resources :field_templates, :only => [:index, :show, :create, :update, :destroy]
      resources :field_template_attributes, :only => [:index, :show, :create, :update, :destroy]
    end
  end
end
Rails.application.routes.draw do

  get 'survey/new'

  mount Blacklight::Engine => '/'

    concern :searchable, Blacklight::Routes::Searchable.new

  resource :catalog, only: [:index], as: 'catalog', path: '/catalog', controller: 'catalog' do
    concerns :searchable
  end

  devise_for :users
  mount Hydra::RoleManagement::Engine => '/'

  mount Qa::Engine => '/authorities'
  mount Hyrax::Engine, at: '/'
  resources :welcome, only: 'index'
  root 'hyrax/homepage#index'
  curation_concerns_basic_routes
  concern :exportable, Blacklight::Routes::Exportable.new

  resources :solr_documents, only: [:show], path: '/catalog', controller: 'catalog' do
    concerns :exportable
  end

  get '/new_summary' => 'hyrax/summaries#new', key: 'new_summary'

  resources :bookmarks do
    concerns :exportable

    collection do
      delete 'clear'
    end
  end

  get '/activities' => 'hyrax/pages#show', key: 'activities'
  get '/people_saying' => 'hyrax/pages#show', key: 'people_saying'

  #mount Resque::Server, :at => "/resque"
  #
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  root 'contacts#index'

  get 'contacts' => 'contacts#index', as: 'contacts'
  get 'contacts/:id' => 'contacts#show', as: 'contact'
  get 'contacts/new' => 'contacts#new', as: 'new_contacts'
  get 'contacts/:id/edit' => 'contacts#edit', as: 'edit_contacts'
  post 'contacts' => 'contacts#create'
  patch 'contacts/:id' => 'contacts#update'
  delete 'contacts/:id' => 'contacts#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

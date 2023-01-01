Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "articles#index"

  resources :articles do
    resources :comments
    resources :likes
  end
  #mapping routes for:
  #   root GET    /                            articles#index
  #   articles GET    /articles(.:format)          articles#index
  #  new_article GET    /articles/new(.:format)      articles#new
  #   article GET    /articles/:id(.:format)      articles#show
  #   POST   /articles(.:format)          articles#create
  # edit_article GET    /articles/:id/edit(.:format) articles#edit
  #   PATCH  /articles/:id(.:format)      articles#update
  #   DELETE /articles/:id(.:format)      articles#destroy
end

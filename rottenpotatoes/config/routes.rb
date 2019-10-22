Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  
  get 'movies/:id/find_with_same_director' => 'movies#find_with_same_director' , :as => :find_with_same_director
end
# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

get '/meetings', to: 'meetings#index'
get '/meetings/new', to: 'meetings#new'
post '/meetings', to: 'meetings#create'

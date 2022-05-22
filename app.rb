require 'sinatra'
require 'movie'
require 'yaml'
require 'movie_store'

# This command set :bind was taken from:
# http://sinatrarb.com/configuration.html#bind---server-hostname-or-ip-address
#
# It's possible also to use command line
# to set the host:
#
# ruby app.rb -o 0.0.0.0
#
# This is similar to rails s -b 0.0.0.0
# Ref https://github.com/sinatra/sinatra
set :bind, '0.0.0.0'

get '/movies' do
  @movies = MovieStore.all
  erb :index
end

get '/movies/new' do
  erb :new
end

get '/movies/:id' do
  @movie = MovieStore.find(params['id'].to_i)

  erb :show
end

post '/movies/create' do
  movie = Movie.new
  movie.title = params['title']
  movie.director = params['director']
  movie.year = params['year']

  redirect '/movies/new' if MovieStore.save(movie)
end

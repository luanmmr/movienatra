require 'sinatra'
require 'movie'
require 'movie_store'

get('/movies') do
  @movies = MovieStore.all
  erb :index
end

get('/movies/new') do
  erb :new
end

post('/movies/create') do
  movie = Movie.new
  movie.title = params['title']
  movie.director = params['director']
  movie.year = params['year']

  MovieStore.create(movie)
  redirect '/movies/new'
end

get('/movies/:id') do
  @movie = MovieStore.find(params['id'].to_i)
  erb :show
end
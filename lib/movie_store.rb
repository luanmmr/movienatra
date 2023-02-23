require 'yaml/store'

class MovieStore
  FILE = "movies.yml"

  def self.create(movie)
    store.transaction do
      movie.id = id_generator
      store[movie.id] = movie
    end
  end

  def self.all
    store.transaction do
      store.roots.map {|id| store[id]}
    end
  end

  def self.find(id)
    store.transaction do
      store[id]
    end
  end

  private

  def self.id_generator
    last_id = store.roots.max || 0
    last_id += 1
  end

  def self.store
    @store ||= YAML::Store.new(FILE)
  end
end
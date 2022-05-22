require 'yaml/store'

class MovieStore
  NAME_FILE = "movie.yml"

  def self.save(movie)
    store.transaction do
      movie.id = movie_id
      store[movie.id] = movie
    end

  rescue => error
    return false
  end

  def self.all
    store.transaction do
      store.roots.map {|id| store[id] }
    end
  end

  def self.find(id)
    store.transaction do
      store[id]
    end
  end

  private

  def self.movie_id
    return 1 unless store.roots.max

    store.roots.max + 1
  end

  def self.store
    @store ||= YAML::Store.new(NAME_FILE)
  end
end
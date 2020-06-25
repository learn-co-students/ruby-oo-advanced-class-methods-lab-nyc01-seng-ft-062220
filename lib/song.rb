require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @name = name
    @artist_name = artist_name

  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    song = Song.new
    song.save 
    song
  end   

  def Song.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def Song.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end


  def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    if Song.find_by_name(song_name)
      return Song.find_by_name(song_name)
    else
      return Song.create_by_name(song_name)
    end
   
  end

  def Song.alphabetical
    @@all.sort_by {|objects| objects.name}
  end

  def Song.new_from_filename(file_name)
    parts = file_name.split(/[-.]/)
    song = Song.new
    song.name = parts[1].slice(1..-1)
    song.artist_name = parts[0].slice(0...-1)
    song
  end

  def Song.create_from_filename(file_name)
    parts = file_name.split(/[-.]/)
    song = Song.new
    song.name = parts[1].slice(1..-1)
    song.artist_name = parts[0].slice(0...-1)
    @@all << song
    # binding.pry
  end

  def Song.destroy_all
      self.all.clear
  end


end

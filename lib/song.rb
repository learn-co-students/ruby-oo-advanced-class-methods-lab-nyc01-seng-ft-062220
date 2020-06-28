require 'pry'

class Song
  attr_accessor :artist_name, :name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(name)
    results = self.all.select {|song| song.name == name}
    return results[0]
  end

  def self.find_or_create_by_name(input)
    self.find_by_name(input) || self.create_by_name(input)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name  }
  end

  def self.new_from_filename(filename)
    split_dash = filename.split(' - ')
    artist = split_dash[0]
    data = split_dash[1]
    title = data.split('.mp3')
    title = title[0]
    song = self.new
    song.artist_name = artist
    song.name = title
    song
  end

  def self.create_from_filename(filename)
    split_dash = filename.split(' - ')
    artist = split_dash[0]
    data = split_dash[1]
    title = data.split('.mp3')
    title = title[0]
    song = self.new
    song.artist_name = artist
    song.name = title
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end


  end


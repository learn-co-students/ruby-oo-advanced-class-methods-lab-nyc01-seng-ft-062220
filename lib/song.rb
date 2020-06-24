require 'pry'

class Song
  
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    if !(self.find_by_name(song_name))
      song = self.new
      song.name = song_name
      self.all << song
    song
    end
  end

  def self.create_by_name(song_name)
    if !(self.find_by_name(song_name))
      song = self.create
      self.all[-1].name = song_name
      # song.name = song_name
      # self.all << song
      song
    end
  end

  def self.find_by_name(song_name)
    self.all.find{|element| element.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if !(self.find_by_name(song_name))
      create_by_name(song_name)
    else
      find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by{ |element|
      element.name
    }
  end

  def self.new_from_filename(filename)
    split_filename = filename.split(' - ')
    split_filename[0] = split_filename[0].strip
    split_filename[1] = split_filename[1].delete_suffix('.mp3')
    if !(self.find_by_name(split_filename[0]))
      song = self.create
      self.all[-1].artist_name = split_filename[0]
      self.all[-1].name = split_filename[1]
      song
    end
  end

  def self.create_from_filename(filename)
    split_filename = filename.split(' - ')
    split_filename[0] = split_filename[0].strip
    split_filename[1] = split_filename[1].delete_suffix('.mp3')
    if !(self.find_by_name(split_filename[0]))
      song = self.create
      self.all[-1].artist_name = split_filename[0]
      self.all[-1].name = split_filename[1]
      song
    end
  end

  def self.destroy_all
    @@all = []
  end

end

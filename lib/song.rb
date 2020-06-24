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

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    song_match = self.all.detect {|each_song| each_song.name == title}
    song_match
  end

  def self.find_or_create_by_name(title)
    song_match = self.find_by_name(title)
    if song_match
      song_match
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    self.all.sort_by {|each_song| each_song.name} # need clarification here
  end


  def self.new_from_filename(filename)
    filename_split = filename.split(" - ")
    filename_split[1] = filename_split[1].chomp(".mp3")
    song = self.new
    song.name = filename_split[1]
    song.artist_name = filename_split[0]
    song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    song = self.create
    song.name = new_song.name
    song.artist_name = new_song.artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end



end

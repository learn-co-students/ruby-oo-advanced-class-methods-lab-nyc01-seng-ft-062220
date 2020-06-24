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
    new_song = self.new
    @@all << new_song
    new_song
  end
  
  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new_by_name(name)
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
      Song.find_by_name(name)
    else
      Song.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(name)
    #perhaps should be own helper method parse_name
    name_parts = name.split("-")
    name_parts[1] = name_parts[1].split(".") 
    name_parts = name_parts.flatten
    song_artist = name_parts[0].strip
    song_name = name_parts[1].strip
    song_format = name_parts[2]

    new_song = Song.new
    new_song.name = song_name
    new_song.artist_name = song_artist
    new_song
    #binding.pry
  end

  def self.create_from_filename(name)
    name_parts = name.split("-")
    name_parts[1] = name_parts[1].split(".") 
    name_parts = name_parts.flatten
    song_artist = name_parts[0].strip
    song_name = name_parts[1].strip
    song_format = name_parts[2]

    new_song = Song.new
    new_song.name = song_name
    new_song.artist_name = song_artist
    @@all<< new_song
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

end

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
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song 
  end

  def self.find_by_name(name)
    self.all.find { |song| 
      song.name == name
    }
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title)
      self.find_by_name(title)
    else
      self.create_by_name(title)
    end
  end

  def self.alphabetical
    Song.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    song = self.new
    song.artist_name = filename.split(/ -./)[0]
    song.name = filename.split(/ -./)[1].split(".")[0]
    song
    # binding.pry
  end

  def self.create_from_filename(filename)
    file_format = self.new_from_filename(filename)
    song = self.create
    song.name = file_format.name
    song.artist_name = file_format.artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

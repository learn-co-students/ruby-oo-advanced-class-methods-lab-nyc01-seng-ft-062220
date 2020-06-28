class Song
  
  attr_accessor :name, :artist_name
  
  @@all = []

  def self.all
    @@all
  end

  #? when/why/how does this instance save method work in order to pass and retain attributes that are added after instantiating (e.g., name creating)
  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
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
    self.all.detect { |song| song.name == title }
  end

  def self.find_or_create_by_name(title)
    #? why is return value to the right of || not boolean??
    # self.find_by_name(title) || self.create_by_name(title) 
    if !(self.find_by_name(title))
      self.create_by_name(title)
    else
      self.find_by_name(title)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  #? helper method to parse filename
  #! is there an issue with passive local variables?
  def self.filename_parser(filename)
    data = filename.split("-")
    artist_name = data[0].strip
    # consider changing ".mp3" parameter to regex to select all data to the right of the dot and return ""
    title = data[1].strip.gsub(".mp3", "")
    return title, artist_name
  end

  def self.new_from_filename(filename)
    title, artist_name = self.filename_parser(filename)
    # data = filename.split("-")
    # artist_name = data[0].strip
    # # consider changing ".mp3" parameter to regex to select all data to the right of the dot and return ""
    # title = data[1].strip.gsub(".mp3", "")
    song = self.new
    song.name = title
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    title, artist_name = filename_parser(filename)

    song = self.create_by_name(title)
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    # the destruction bebavior of class variable takes place here, but it also must be reflected in class variable (via reader)
    #? so, is there a subtle distinction between clear and statically setting "@@all = []" to clear contents?
    #? I suspect '.clear' may contribute toward some efficiency by avoiding the creation of a new object array? do these objects point to new memory locations?
    self.all.clear
  end

end
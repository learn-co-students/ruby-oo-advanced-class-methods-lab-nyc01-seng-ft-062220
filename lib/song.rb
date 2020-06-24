class Song
  attr_accessor :name, :artist_name
  @@all = []

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

  def Song.new_by_name(name)
    song = Song.new
    song.name = name 
    song 
  end 
  
  def Song.create_by_name(name)
    song = Song.create 
    song.name = name
    song
  end
  
  def Song.find_by_name(name)
    self.all.detect do |element|
      element.name == name 
    end
  end     
  
  def Song.find_or_create_by_name(name)
    Song.find_by_name(name)|| Song.create_by_name(name)
  end 

  def Song.alphabetical 
    @@all.sort_by {|element| element.name}
  end   
  
  def Song.new_from_filename(filename)
    song = Song.new
    filename_without_mp3 = filename.slice!(0..filename.length-5)
    delimiter = filename_without_mp3.split(' - ')
    song.name = delimiter[1]
    song.artist_name = delimiter[0]
    song
  end

  def Song.create_from_filename(filename)
    song = Song.new
    filename_without_mp3 = filename.slice!(0..filename.length-5)
    delimiter = filename_without_mp3.split(' - ')
    
    song = self.create 
    song.name = delimiter[1]
    song.artist_name = delimiter[0]
    song
  end   

  def self.destroy_all
    self.all.clear 
  end   
end
  

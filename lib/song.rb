require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.all
    @@all
  end
  
  def self.create
    song = Song.new
    song.save 
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create 
    song.name = song_name
    song
  end
  
  def self.find_by_name(song_name)
      self.all.find do |songs|
        songs.name == song_name
      end
    end
  
    def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by do |songs|
      songs.name
    end
  end


  def save
    self.class.all << self
  end
  
  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename(file)
   new_arr =  file.split(" - ")
   song_mp3 = new_arr[1]
   artist = new_arr[0]
   song = song_mp3.split(".")
   song = song[0] 
   
   new_song_instance = self.new 
   new_song_instance.artist_name = artist
   new_song_instance.name = song
   new_song_instance
  end

  def self.create_from_filename(file)
    new_arr =  file.split(" - ")
    song_mp3 = new_arr[1]
    artist = new_arr[0]
    song = song_mp3.split(".")
    song = song[0] 
    
    new_song_instance = self.create 
    new_song_instance.artist_name = artist
    new_song_instance.name = song
    new_song_instance
  end
    
end
# binding.pry
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
  song=Song.new
  @@all<<song
  song 
  end

  def self.new_by_name(song_name)
  song=Song.new
  song.instance_variable_set(:@name, song_name)
  song
  
  end

  def self.create_by_name(song_name)
  song=self.new_by_name(song_name)
  @@all<<song
  song
  end 

  def self.find_by_name(song_name)
    @@all.find do |song|
      song.name==song_name
  end
end

  def self.find_or_create_by_name(song_name)
  song=self.find_by_name(song_name)
    if song==nil
    song=self.create_by_name(song_name)
    end
  song
  end

  def self.alphabetical
  @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    split_1=filename.split('.')
    split_2=split_1[0].split('-')
    artist=split_2[0].strip
    song=split_2[1].strip
    new_song=Song.new
    new_song.instance_variable_set(:@artist_name, artist)
    new_song.instance_variable_set(:@name, song)
    new_song
  end
  def self.create_from_filename(filename)
    song=self.new_from_filename(filename)
    @@all<<song 
  end

  def self.destroy_all
    @@all=[]
  end 
end



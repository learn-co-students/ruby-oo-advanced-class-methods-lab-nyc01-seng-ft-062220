require "pry"
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
    
    temp_data = self.new
    temp_data.save
    temp_data
  end
 
    def self.new_by_name (name)
      temp_data = self.new
      
      temp_data.name = name
      temp_data


    end  
    def self.create_by_name(name)
      temp_data = new_by_name(name)
      self.all << temp_data
      temp_data 
    end  

    def self.find_by_name(name)
      self.all.find {|i| i.name == name}
    end 

    def self.find_or_create_by_name(name)
      if find_by_name(name)
        find_by_name(name)
      else
        create_by_name(name)
      end
    end
    
    def self.alphabetical
      @@all.sort_by{|i| i.name}
      
    end  

    def self.new_from_filename (string)
      
      song_info = string.chomp(".mp3").split(" - ")
      
      
      temp_data = self.new


      temp_data.name = song_info[1]
      temp_data.artist_name = song_info[0]
      temp_data



    end  

    def self.create_from_filename(string)
      self.all << new_from_filename(string)
    end
    
    def self.destroy_all
      self.all.clear
    end  
end

require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self        #what does "class" do?
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name (song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name (song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name (song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name (song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end 
  end

  def self.new_from_filename(filename)
    data = filename.split("-")                
    filename_name = data[1].strip.chomp(".mp3")
    filename_artist = data[0].strip

    song = self.new
    song.name = filename_name
    song.artist_name = filename_artist
    song
  end

  def self.create_from_filename(filename)
    data = filename.split("-")                
    filename_name = data[1].strip.chomp(".mp3")
    filename_artist = data[0].strip

    song = self.new
    song.name = filename_name
    song.artist_name = filename_artist
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end


# binding.pry
# "after pry"  
end



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
    song = Song.new
    self.all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end
  
  def self.new_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    self.new_by_name(song_name)
  end

  def self.find_by_name(song_name)
    self.all.detect{|i| i.name == song_name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? (self.find_by_name(name)) : (self.create_by_name(name))
  end

  def self.new_from_filename(filename)
    a_s = filename.delete_suffix(".mp3").split(" - ")
    art_name = a_s[0]
    song_name = a_s[1]
    song = self.find_or_create_by_name(song_name)
    song.artist_name = art_name
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.alphabetical
    sorted = self.all.sort_by{|i| i.name}
  end

end





















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
    song.save
    song
  end

  def self.new_by_name(name)
    def initialize(name)
      @name = name
    end
    song = self.new(name)
    song.save
    song
  end

  def self.create_by_name(name)
    self.new_by_name(name)
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    full_title = []
    full_title = filename.split('-')
    artist = full_title[0].strip
    song_name = full_title[-1].chomp('.mp3').strip

    def initialize(artist_name, name)
      @artist_name = artist_name
      @name = name
    end
    self.new(artist, song_name)

  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    @@all = []
  end

end

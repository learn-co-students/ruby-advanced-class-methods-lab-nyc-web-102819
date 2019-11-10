require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  # def initialize(artist_name, name)
  #   @artist_name = artist_name
  #   @name = name
  # end

  def self.all
    @@all
  end

  def self.create
    @s = Song.new
    @s.save
    @s
  end

  def self.new_by_name(song_name)
    @s
    @s.name = song_name
    @s
  end

  def self.create_by_name(song_name)
    @sc = self.create
    @sc.name = song_name
    @sc
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def save
    self.class.all << self
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    artist_and_title = file.split(" - ")
    artist_name = artist_and_title[0]
    song_name = artist_and_title[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file)
    artist_and_title = file.split(" - ")
    artist_name = artist_and_title[0]
    song_name = artist_and_title[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

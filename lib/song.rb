require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @name = name 
    @artist_name =artist_name
  end

  def self.create
    song = self.new 
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name =name
    song
  end

  def self.all
    @@all
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name 
    song.save
    song
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    @@all.find {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end

  def self.new_from_filename(filename)
    split_filename = filename.slice(0, filename.length-4).split(' - ')
    song = Song.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song
  end

  def self.create_from_filename(filename)
    split_filename = filename.slice(0, filename.length-4).split(' - ')
    song = Song.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end




end


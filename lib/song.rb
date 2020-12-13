class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #this replaces the normal syntax of -> new_song = song.New with --> new_song = Song.create ... which pushes the new instance of song into the @@all array 
    song = Song.new 
    song.save 
    song
  end

  def self.new_by_name(song_name) #allows you to create a new instnace of song but provide a name by which you can right away assign to the instnace variable of -> name 
    song = Song.new
    song.name = song_name
    song
  end 

  def self.create_by_name(name_of_song)
    new_song = Song.new 
    new_song.name = name_of_song
    new_song.save
    new_song
  end

  def self.find_by_name(song_name)
    self.all.detect{|s| s.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name) #if find by name returns true then it stops... if it does not then it will call create_by_name
  end


  def self.alphabetical
    self.all.sort_by{|s| s.name} #compares the names of the song instances in the all-class array and orders them alphabetically
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end


  def self.destroy_all
    self.all.clear   #self.all = [] does not work because there is no setter method for @@all
  end 

end

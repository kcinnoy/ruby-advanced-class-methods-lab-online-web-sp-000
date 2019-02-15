class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.create
    song = self.new
    song.save
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
      self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    song = self.new
    song_data = file.chomp(".mp3").split(" - ")
    song.artist_name = song_data[0]
    song.name = song_data[1]
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

class Guest

  attr_reader :guest_name, :guest_favourite_song
  attr_accessor :guest_money 

  def initialize(guest_name,guest_money,guest_favourite_song)
    @guest_name=guest_name
    @guest_money=guest_money
    @guest_favourite_song=guest_favourite_song
    @guest_playlist=[]
  end

  def guest_playlist
    return @guest_playlist
  end

  def add_to_guest_playlist(song)
    @guest_playlist.push(song)
    song_name=song.song_title()
    puts "The song titled '#{song_name}' has been added to '#{guest_name}'s' playlist"
  end

  def remove_song_from_guest_playlist(song)
    @guest_playlist.delete(song)
    song_name=song.song_title()
    puts "The song titled '#{song_name}' has been deleted from '#{guest_name}'s' playlist"
  end

end
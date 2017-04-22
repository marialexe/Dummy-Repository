class Song

attr_reader :song_title, :song_singer, :song_type, :song_album

  def initialize(song_title,song_singer,song_type,song_album)
    @song_title=song_title
    @song_singer=song_singer
    @song_type=song_type
    @song_album=song_album
  end

end
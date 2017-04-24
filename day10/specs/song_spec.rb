require('minitest/autorun')
require('minitest/emoji')

require_relative('../song.rb')

class TestSong < MiniTest::Test

  def setup
    @song1=Song.new("The Best","Tina Turner","80's","Foreign Affair")
    @song2=Song.new("Cry Baby","Janis Joplin","Blues","Pearl")
    @song3=Song.new("Proud Mary","Tina Turner","80's","Workin' Together")
    @song4=Song.new("Kozmic Blues","Janis Joplin","Blues","I Got Dem Ol'Kozmic Blues Again Mama!")
  end

  def test_can_create_song
    assert_equal(Song,@song1.class())
    assert_equal(Song,@song2.class())
  end

  def test_song_title
    assert_equal("The Best",@song1.song_title())
    assert_equal("Cry Baby",@song2.song_title())
  end

  def test_song_singer
    assert_equal("Tina Turner",@song1.song_singer())
    assert_equal("Janis Joplin",@song2.song_singer())
  end

  def test_song_type
    assert_equal("80's",@song1.song_type())
    assert_equal("Blues",@song2.song_type())
  end

  def test_song_album
    assert_equal("Foreign Affair",@song1.song_album())
    assert_equal("Pearl",@song2.song_album())
  end

  

end
require('minitest/autorun')
require('minitest/emoji')

require_relative('../guest.rb')
require_relative('../song.rb')

class TestGuest < Minitest::Test

  def setup
    @guest1=Guest.new("Marilena",50,"Little Girl Blue")
    @guest2=Guest.new("Dina",75,"Proud Mary")

    @song1=Song.new("Proud Mary","Tina Turner","80's","Workin' Together")
    @song2=Song.new("The Best","Tina Turner","80's","Foreign Affair")
    @song3=Song.new("Cry Baby","Janis Joplin","Blues","Pearl")
    @song4=Song.new("Kozmic Blues","Janis Joplin","Blues","I Got Dem Ol'Kozmic Blues Again Mama!")
  end

  def test_can_create_guest
    assert_equal(Guest,@guest1.class())
  end

  def test_guest_name
    assert_equal("Marilena",@guest1.guest_name())
    assert_equal("Dina",@guest2.guest_name())
  end
  
  def test_guest_money
    assert_equal(50,@guest1.guest_money())
    assert_equal(75,@guest2.guest_money())
  end

  def test_guest_favourite_song
    assert_equal("Little Girl Blue",@guest1.guest_favourite_song())
    assert_equal("Proud Mary",@guest2.guest_favourite_song())
  end

  def test_initial_guest_playlist_is_empty
    assert_equal(0,@guest1.guest_playlist().count())
    assert_equal(0,@guest2.guest_playlist().count())
  end

  def test_add_a_song_to_guest_playlist
    @guest1.add_to_guest_playlist(@song1)
    assert_equal(1,@guest1.guest_playlist().count())

    @guest2.add_to_guest_playlist(@song3)
    assert_equal(1,@guest1.guest_playlist().count())
  end

  def test_add_multiple_songs_to_guest_playlist
    @guest1.add_to_guest_playlist(@song1)
    @guest1.add_to_guest_playlist(@song2)

    assert_equal(2,@guest1.guest_playlist().count())

    @guest1.add_to_guest_playlist(@song3)
    assert_equal(3,@guest1.guest_playlist().count())
  end

  def test_remove_song_from_guest_playlist
    @guest1.add_to_guest_playlist(@song1)
    @guest1.add_to_guest_playlist(@song2)
    @guest1.add_to_guest_playlist(@song3)
    @guest1.add_to_guest_playlist(@song4)

    assert_equal(4,@guest1.guest_playlist().count())

    @guest1.remove_song_from_guest_playlist(@song2)
    assert_equal(3,@guest1.guest_playlist().count())

    @guest1.remove_song_from_guest_playlist(@song1)
    assert_equal(2,@guest1.guest_playlist().length())
  end



end
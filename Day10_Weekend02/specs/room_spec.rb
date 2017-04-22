require('minitest/autorun')
require('minitest/emoji')

require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

class TestRoom < MiniTest::Test

  def setup
    @room1=Room.new("80's",1,5,65)

    @guest1=Guest.new("Marilena",100,"Little Girl Blue")
    @guest2=Guest.new("Dina",70,"Proud Mary")
    @guest3=Guest.new("Teresa",50,"The Best")

    @song1=Song.new("Kozmic Blues","Janis Joplin","Blues","I Got Dem Ol'Kozmic Blues Again Mama!")
    @song2=Song.new("L.A. Woman", "The Doors", "Blues rock","L.A. Woman" )
    @song3=Song.new("Back to Black", "Amy Winehouse", "R&B","Back to Black")
    @song4=Song.new("Back to Black", "Amy Winehouse", "R&B","Rehab")
    @song5=Song.new("Rolling in the deep", "Adele", "Pop","21")
  end

  def test_can_create_room
    assert_equal(Room,@room1.class())
  end

  def test_room_name
    assert_equal("80's",@room1.room_name())
  end

  def test_room_number
    assert_equal(1,@room1.room_number())
  end

  def test_room_max_capacity
    assert_equal(5,@room1.room_capacity())
  end

  def test_room_price
    assert_equal(65,@room1.room_price())
  end

  def test_check_in_list_initially_empty
    assert_equal(0,@room1.pre_check_in().length())
  end

  def test_check_in_guests
    assert_equal(1,@room1.check_in(@guest1).length())
    assert_equal(2,@room1.check_in(@guest2).length())
    assert_equal(3,@room1.check_in(@guest3).length())
  end

  def test_check_out_guests
    @room1.check_in(@guest1)
    @room1.check_in(@guest2)
    @room1.check_in(@guest3)
    guest4=Guest.new("Sezen",125,"Summertime")
    guest5=Guest.new("Mari",75,"Bohemian Rapsody")
    @room1.check_in(@guest4)
    @room1.check_in(@guest5)
    assert_equal(4,@room1.check_out(@guest3).length())
    assert_equal(3,@room1.check_out(@guest1).length())
  end

  # def test_room_is_fully_booked
  #   assert_equal(true,@room1.room_is_fully_booked())
  # end

  def test_room_playlist_is_initially_empty
    assert_equal(0,@room1.room_playlist().length())
  end

  def test_add_songs_to_room_playlist
    @room1.add_songs_to_room_playlist(@song1)
    @room1.add_songs_to_room_playlist(@song2)
    assert_equal(2,@room1.room_playlist().length())
  end

  def test_add_guest_playlist_to_room_playlist
    @room1.check_in(@guest1)
    @room1.check_in(@guest2)

    @room1.add_songs_to_room_playlist(@song2)
    @room1.add_songs_to_room_playlist(@song5)

    @guest1.add_to_guest_playlist(@song1)
    @guest1.add_to_guest_playlist(@song3)
    @guest2.add_to_guest_playlist(@song4)
    @guest2.add_to_guest_playlist(@song5)

    @room1.add_guest_playlist_to_room_playlist(@guest1)
    assert_equal(4,@room1.room_playlist().length())

    @room1.add_guest_playlist_to_room_playlist(@guest2)
    assert_equal(5,@room1.room_playlist().length())
  end

end
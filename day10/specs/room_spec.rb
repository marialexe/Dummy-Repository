require('minitest/autorun')
require('minitest/emoji')

require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../caraoke_venue.rb')

class TestRoom < MiniTest::Test

  def setup
    @caraoke_venue=CaraokeVenue.new()

    @room1=Room.new("80's",1,5,75,15)
    @room2=Room.new("70's",2,2,40,20)
    @room3=Room.new("R&B",3,3,54,18)
    @room4=Room.new("Disco",3,7,84,12)
    @room5=Room.new("Rock",5,10,100,10)

    @guest1=Guest.new("Marilena",100,"Little Girl Blue")
    @guest2=Guest.new("Dina",70,"Proud Mary")
    @guest3=Guest.new("Teresa",50,"The Best")
    @guest4=Guest.new("Carol",17,"Hello")
    @guest5=Guest.new("Victoria",90,"No regrets")
    @guest6=Guest.new("Cristina",12,"Let me entertain you")


    @song1=Song.new("Kozmic Blues","Janis Joplin","Blues","I Got Dem Ol'Kozmic Blues Again Mama!")
    @song2=Song.new("L.A. Woman", "The Doors", "Blues rock","L.A. Woman" )
    @song3=Song.new("Back to Black", "Amy Winehouse", "R&B","Back to Black")
    @song4=Song.new("Back to Black", "Amy Winehouse", "R&B","Rehab")
    @song5=Song.new("Rolling in the deep", "Adele", "Pop","21")
    @song6=Song.new("No Regrets", "Robbie Williams", "Pop","Greatest Hits")
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
    assert_equal(75,@room1.room_price())
  end

  def test_entry_fee
    assert_equal(15,@room1.entry_fee())
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

  def test_room_availability__room_available
    @room2.check_in(@guest1)
    assert_equal(true,@room2.room_availability())
  end

  def test_room_availability__room_NOT_available1
    @room2.check_in(@guest1)
    @room2.check_in(@guest2)
    assert_equal(false,@room2.room_availability())
  end

  def test_room_availability__room_NOT_available2
    @room3.check_in(@guest3)
    assert_equal(true,@room3.room_availability())

    @room3.check_in(@guest4)
    assert_equal(true,@room3.room_availability())

    @room3.check_in(@guest5)
    assert_equal(false,@room3.room_availability())
  end

# test_getting_errors
  def test_entrance_fee_based_check_in__fee_paid
    @caraoke_venue.venue_rooms(@room1)
    @caraoke_venue.fee_payment(@room1,@guest3)

    assert_equal(1,@room1.entrance_fee_based_check_in(@caraoke_venue,@room1,@guest3).length())
  end
  
  # test_getting_errors
  def test_entrance_fee_based_check_in__insuficient_funds
    @caraoke_venue.venue_rooms(@room1)
    @caraoke_venue.fee_payment(@room1,@guest6)

    assert_equal(0,@room1.entrance_fee_based_check_in(@caraoke_venue,@room1,@guest6).length())
  end

  # test_getting_errors
  def test_guest_fav_song_reaction
    # @room1.check_in(@guest4)
    @room1.check_in(@guest5)
    @room1.add_songs_to_room_playlist(@song6)
    assert_equal("Whoo!",@room1.guest_fav_song_reaction(@guest5))
  end


end
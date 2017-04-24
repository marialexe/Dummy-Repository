require('minitest/autorun')
require('minitest/emoji')

require_relative('../caraoke_venue.rb')
require_relative('../room.rb')
require_relative('../guest.rb')

class TestCaraokeVenue < MiniTest::Test

  def setup
    @caraoke_venue=CaraokeVenue.new()

    @room1=Room.new("80's",1,5,75,15)
    @room2=Room.new("70's",2,2,40,20)
    @room3=Room.new("R&B",3,3,54,18)
    @room4=Room.new("Disco",4,7,84,12)
    @room5=Room.new("Rock",5,10,100,10)

    @guest1=Guest.new("Marilena",100,"Little Girl Blue")
    @guest2=Guest.new("Dina",70,"Proud Mary")
    @guest3=Guest.new("Teresa",50,"The Best")
    @guest4=Guest.new("Carol",17,"Hello")
    @guest5=Guest.new("Victoria",90,"No regrets")
    @guest6=Guest.new("Cristina",12,"Let me entertain you")

  end

  def test_can_create_venue
    assert_equal(CaraokeVenue,@caraoke_venue.class)
  end

  def test_add_venue_rooms
    assert_equal(1,@caraoke_venue.add_venue_rooms(@room1).length())
    assert_equal(2,@caraoke_venue.add_venue_rooms(@room2).length())
  end

  def test_venue_rooms
    @caraoke_venue.add_venue_rooms(@room1)
    assert_equal(1,@caraoke_venue.venue_rooms().length())
    @caraoke_venue.add_venue_rooms(@room1)
    assert_equal(2,@caraoke_venue.venue_rooms().length())
  end

  def test_fee_payment__fee_paid
    @caraoke_venue.add_venue_rooms(@room1)
    @room1.check_in(@guest1)
    assert_equal(true,@caraoke_venue.fee_payment(@room1,@guest1))

    @caraoke_venue.add_venue_rooms(@room5)
    @room1.check_in(@guest6)
    assert_equal(true,@caraoke_venue.fee_payment(@room5,@guest6))

  end

  def test_fee_payment__insuficient_funds
    @caraoke_venue.add_venue_rooms(@room1)
    @room1.check_in(@guest6)
    assert_equal(false,@caraoke_venue.fee_payment(@room1,@guest6))

    @caraoke_venue.add_venue_rooms(@room3)
    @room1.check_in(@guest4)
    assert_equal(false,@caraoke_venue.fee_payment(@room3,@guest4))

  end

end
require('minitest/autorun')
require('minitest/emoji')

require_relative('../caraoke_venue.rb')

class TestCaraokeVenue < MiniTest::Test

  def setup
    @caraoke_venue=CaraokeVenue.new()
    
  end

  def test_can_create_venue
    assert_equal(CaraokeVenue,@caraoke_venue.class)
  end

  def test_choose_room
    assert_equal("80's",@caraoke_venue.room_name())
    # assert_equal("70's",@caraoke_venue.room_name())
  end

  def test_choose_room
    
  end

end
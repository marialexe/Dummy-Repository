class Room

attr_reader :room_name,:room_number, :room_capacity, :room_price, :entry_fee

  def initialize(room_name,room_number,room_capacity,room_price,entry_fee)
    @room_name=room_name
    @room_number=room_number
    @room_capacity=room_capacity
    @room_price=room_price
    @entry_fee=room_price/room_capacity
    @guest_array=[]
    @room_playlist=[]
    @spaces_available=room_capacity
    @room_available=true
    @string=""
  end

  def pre_check_in
    return @guest_array
  end

  def check_in(guest)
    @guest_array << guest
    #next line has been added to the "check_in" method only later, while running the test "test_room_availability__room_available"
    @spaces_available-=1
    return @guest_array
  end

  def check_out(guest)
    @guest_array.delete(guest)
    #next line has been added to the "check_out" method only later, while running the test "test_room_availability__room_available"
    @spaces_available+=1
    return @guest_array
  end

  def room_playlist
    return @room_playlist
  end

  def add_songs_to_room_playlist(song)
    @room_playlist << song
  end

  def add_guest_playlist_to_room_playlist(guest)
    @room_playlist=@room_playlist | guest.guest_playlist()
  end

  def room_availability
    if @spaces_available > 1
      puts "There are #{@spaces_available} spaces available in #{room_name} room!"
    elsif @spaces_available == 1
      puts "There is only #{@spaces_available} space available in #{room_name} room!"
    else 
      puts "Sorry! :( #{room_name} room is full! Try a different room!"
      @room_available=false
    end
    return @room_available
  end

# function work in progress
  def entrance_fee_based_check_in(venue,room,guest)
    for room in venue.venue_rooms()
      if venue.fee_payment(room,guest) == true
        room.check_in(guest)
        guest.guest_money()-=@entry_fee
      end
    end
    return @guest_array
  end
  
  # function work in progress
  def guest_fav_song_reaction(guest)
    for guest in @guest_array
      for song in @room_playlist
        if song.song_title() == guest.guest_favourite_song()
          @string = "Whoo!"
        end
      end
    end
    return @string
  end

end
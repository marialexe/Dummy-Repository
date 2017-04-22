class Room

attr_reader :room_name,:room_number, :room_capacity, :room_price

  def initialize(room_name,room_number,room_capacity,room_price)
    @room_name=room_name
    @room_number=room_number
    @room_capacity=room_capacity
    @room_price=room_price
    @guest_array=[]
    @room_playlist=[]
  end

  def pre_check_in
    return @guest_array
  end

  def check_in(guest)
    @guest_array << guest
    # return @guest_array
  end

  def check_out(guest)
    @guest_array.delete(guest)
    return @guest_array
  end

  # def room_is_fully_booked
  #   @room1.@guest_array.length() >= @room_capacity ? true : false
  # end

  def room_playlist
    return @room_playlist
  end

  def add_songs_to_room_playlist(song)
    @room_playlist << song
  end

  def add_guest_playlist_to_room_playlist(guest)
    @room_playlist=@room_playlist | guest.guest_playlist()
  end



end
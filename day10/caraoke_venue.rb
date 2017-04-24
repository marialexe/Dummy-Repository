class CaraokeVenue

  def initialize
    @venue_rooms=[]
    @entry_fee=0
    @fee_paid=false
  end

  def add_venue_rooms(room)
    @venue_rooms << room
    @entry_fee=room.entry_fee()
    return @venue_rooms
  end

  def venue_rooms()
    return @venue_rooms
  end


  def fee_payment(room,guest)
    for room in @venue_rooms
      for guest in room.pre_check_in()
        if guest.guest_money() >= @entry_fee
          @fee_paid=true
          puts "Please proceed to check in!"
        end
      end
    end
    puts "Not enough money to pay the entrance fee!"
    return @fee_paid
  end

end
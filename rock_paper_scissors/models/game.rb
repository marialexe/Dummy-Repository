class Game

  def initialize(player1,player2)
    @player1 = player1
    @player2 = player2
    @options = ["rock", "paper", "scissors", "draw"]
  end

  def play
    if ((@player1 == @options[0]) && (@player2 == @options[2])) || ((@player1 == @options[2]) && (@player2 == @options[0]))
      return "Rock wins!"
    elsif ((@player1 == @options[0]) && (@player2 == @options[1])) || ((@player1 == @options[1]) && (@player2 == @options[0]))
      return "Paper wins!"
    elsif ((@player1 == @options[1]) && (@player2 == @options[2])) || ((@player1 == @options[2]) && (@player2 == @options[1]))
      return "Scissors wins!"
    else @player1 == @player2
      return "It's a draw!"
    end
  end

end
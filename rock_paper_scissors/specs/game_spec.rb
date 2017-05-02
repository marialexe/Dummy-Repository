require('minitest/autorun')
require('minitest/emoji')
require_relative('../models/game.rb')

class TestGame < Minitest::Test

  def setup
    @game1 = Game.new("rock","scissors")
    @game2 = Game.new("scissors","rock")
    @game3 = Game.new("paper","scissors")
    @game4 = Game.new("scissors","paper")
    @game5 = Game.new("paper","rock")
    @game6 = Game.new("rock","paper")
    @game7 = Game.new("paper","paper")
    @game8 = Game.new("scissors","scissors")
    @game9 = Game.new("rock","rock")
  end

  def test_can_create_game
    assert_equal(Game,@game1.class())
  end

  def test_play__rock_wins
    assert_equal("Rock wins!",@game1.play())
    assert_equal("Rock wins!",@game2.play())
  end

  def test_play__scissors_wins
    assert_equal("Scissors wins!",@game3.play())
    assert_equal("Scissors wins!",@game4.play())
  end

  def test_play__paper_wins
    assert_equal("Paper wins!",@game5.play())
    assert_equal("Paper wins!",@game6.play())
  end

  def test_play__draw
    assert_equal("It's a draw!",@game7.play())
    assert_equal("It's a draw!",@game8.play())
    assert_equal("It's a draw!",@game9.play())
  end


end
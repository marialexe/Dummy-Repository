require('minitest/autorun')
require('minitest/pride')
require_relative('./sports_team')

# Part B - Sports Team Class Tests
class TestSportsTeam < MiniTest::Test

  def setup
    @team=SportsTeam.new("Sarcastics", ["Sarcastic1", "Sarcastic2", "Sarcastic3"], "Chief_Sarcastic")
  end

  def test_team_name
    assert_equal("Sarcastics",@team.team_name)
  end

  def test_players
    assert_equal(["Sarcastic1", "Sarcastic2", "Sarcastic3"],@team.players)
  end

  def test_coach_name
    assert_equal("Chief_Sarcastic",@team.coach_name)
  end

  def test_set_coach_name
    @team.set_coach_name("Chief_Nice")
    assert_equal("Chief_Nice",@team.coach_name)
  end

  def test_add_player_to_team
    assert_equal("Sarcastic4",@team.add_player_to_team("Sarcastic4"))
  end

  def test_find_players_by_name
    assert_equal("Sarcastic3",@team.find_player_by_name("Sarcastic3"))
  end

  def test_win_or_loss_update_points
    assert_equal(3,@team.win_or_loss_update_points("win"))
    assert_equal(-3,@team.win_or_loss_update_points("lose"))
  end

end
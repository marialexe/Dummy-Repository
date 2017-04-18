class SportsTeam

attr_accessor :team_name, :players, :coach_name, :result, :points

  def initialize (team_name, players, coach_name)
    @team_name=team_name
    @players=players
    @coach_name=coach_name
    @points=0
    @result=result
  end

# pre-refactoring methods
=begin 
  def team_name
    return @team_name
  end

  def players
    return @players
  end

  def coach_name
    return @coach_name
  end
=end

  def set_coach_name(new_coach_name)
    @coach_name=new_coach_name
  end

  def add_player_to_team(new_player)
    @players.push(new_player)
    return @players.last
  end

  def find_player_by_name(player_name)
    for player in @players
      if player == player_name
        return player
      end
    end
    return nil
  end

  def win_or_loss_update_points(result)
    @points+=3 if @result == "win"
    @points-=3 if @result == "lose"
    @points+=0 if @result == "draw"
  end

end
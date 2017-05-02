require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('models/game.rb')

# route1 - rock wins

  # returns the result of the game using the "result.erb" view file
  get '/rock/scissors' do 
    game1 = Game.new("rock","scissors")
    @result = game1.play()
    erb(:result)
  end

  # returns only a string
  get '/rock/scissors' do 
    game1 = Game.new("rock","scissors")
    result = game1.play()
    return result
  end

# route2 - rock wins

  # returns the result of the game using the "result.erb" view file
  get '/scissors/rock' do
    game2 = Game.new("scissors","rock")
    @result = game2.play()
    erb(:result)
  end

  # returns only a string
  get '/scissors/rock' do
    game2 = Game.new("scissors","rock")
    result = game2.play()
    return result
  end

# route3 - scissors wins

  # returns the result of the game using the "result.erb" view file
  get '/scissors/paper' do 
    game3 = Game.new("paper","scissors")
    @result = game3.play()
    erb(:result)
  end

  # returns only a string
  get '/scissors/paper' do 
    game3 = Game.new("paper","scissors")
    result = game3.play()
    return result
  end

# route4 - scissors wins
  
  # returns the result of the game using the "result.erb" view file
  get '/paper/scissors' do 
    game4 = Game.new("scissors","paper")
    @result = game4.play()
    erb(:result)
  end

  # returns only a string
  get '/paper/scissors' do 
    game4 = Game.new("scissors","paper")
    result = game4.play()
    return result
  end

# route5 - paper wins

  # returns the result of the game using the "result.erb" view file
  get '/paper/rock' do 
    game5 = Game.new("paper","rock")
    @result = game5.play()
    erb(:result)
  end

  # returns only a string
  get '/paper/rock' do 
    game5 = Game.new("paper","rock")
    result = game5.play()
    return result
  end

# route6 - paper wins

  # returns the result of the game using the "result.erb" view file
  get '/rock/paper' do 
    game6 = Game.new("rock","paper")
    @result = game6.play()
    erb(:result)
  end

  # returns only a string
  get '/rock/paper' do 
    game6 = Game.new("rock","paper")
    result = game6.play()
    return result
  end

# route7 - draw when both players choose paper
  
  # returns the result of the game using the "result.erb" view file
  get '/paper/paper' do 
    game7 = Game.new("paper","paper")
    @result = game7.play()
    erb(:result)
  end

  # returns only a string
  get '/paper/paper' do 
    game7 = Game.new("paper","paper")
    result = game7.play()
    return result
  end

# route8 - draw when both players choose scissors
  
  # returns the result of the game using the "result.erb" view file
  get '/scissors/scissors' do 
    game8 = Game.new("scissors","scissors")
    @result = game8.play()
    erb(:result)
  end

  # returns only a string
  get '/scissors/scissors' do 
    game8 = Game.new("scissors","scissors")
    result = game8.play()
    return result
  end

# route9 - draw when both players choose rock

  # returns the result of the game using the "result.erb" view file
  get "/rock/rock" do 
    game9 = Game.new("rock","rock")
    @result = game9.play()
    erb(:result)
  end

  # returns only a string
  get "/rock/rock" do 
    game9 = Game.new("rock","rock")
    result = game9.play()
    return result
  end

get '/' do
  erb(:welcome)
end



require 'sinatra'
require "sinatra/reloader"

def get_rps()
  out = ""
  x = rand(1..3)
  if(x == 1)
    out = "rock"
  elsif(x == 2)
    out = "paper"
  else
    out = "scissors"
  end
  return out
end

def get_outcome(user,comp)
  out = "We won!"
  if(user == "rock")
    if(comp == "rock")
      out = "We tied!"
    elsif(comp == "paper")
      out = "We lost!"
    end
  elsif(user == "paper")
    if(comp == "paper")
      out = "We tied!"
    elsif(comp == "scissors")
      out = "We lost!"
    end
  else
    if(comp == "rock")
      out = "We lost!"
    elsif(comp == "scissors")
      out = "We tied!"
    end
  end
  return out
end

get('/') do
  erb(:home)
end

get('/rock') do
  @user_move = "rock"
  @comp_move = get_rps()
  @outcome = get_outcome(@user_move,@comp_move)
  erb(:rps)
end

get('/paper') do
  @user_move = "paper"
  @comp_move = get_rps()
  @outcome = get_outcome(@user_move,@comp_move)
  erb(:rps)
end

get('/scissors') do
  @user_move = "scissors"
  @comp_move = get_rps()
  @outcome = get_outcome(@user_move,@comp_move)
  erb(:rps)
end

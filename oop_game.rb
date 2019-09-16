require 'pry'
require './game'
# require 'rails_helper'

## Your test code can go here
game = Game.new

while game.is_playing?
  game.play_a_round
end

game.result
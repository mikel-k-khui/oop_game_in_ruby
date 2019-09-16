# Player class to track each player's lives
# @State: Playing
# @Behaviour(s):
# initial setup with 3 maximum lives and empty string for answers 
# lose a live when get one question wrong,
# return game over when live reaches 0,
# getter assess if user is still alive
# Output message if too many players were added (private as only the other class will interact)
class Player
  MAX_LIVES = 3

  attr_reader :current_lives, :current_answer

  def initialize
    @current_lives = MAX_LIVES
    @current_answer = 0
    #byebug
  end

  def inspect
    puts "player is still alive? #{still_alive?} #{@current_lives}/#{MAX_LIVES}"
  end

  def lose_life
    still_alive? ? @current_lives -= 1 : false
  end

  def still_alive?
    return @current_lives != 0 ? true : false
  end

  def set_answer
    print ">"
    @current_answer = $stdin.gets.chomp.to_i || 0 
  end

  protected

end
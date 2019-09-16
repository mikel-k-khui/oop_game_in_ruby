# Main interface to interact with users to track the status of the game
# @State: Playing
# @Behaviour(s):
# initialize the Game with two players,
# assess if answer is correct
# assess if game is still running based on player lives
# common outputs for correct or wrong answer
# common output for setting up the question
require './player'
require './question'

class Game 

  PLAYER_1 = "Player 1"
  PLAYER_2 = "Player 2"
  # attr_reader :player1, :player2, :question

  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @question = Question.new
    #byebug
  end

  def inspect
    "player1: #{@player1.still_alive?} with player2: #{@player2.still_alive?} answering #{@question.addend_1} + #{@question.addend_2}"
  end

  def play_a_round
    @question.refresh
    puts PLAYER_1 + ": What does #{@question.addend_1} plus #{@question.addend_2} equal?"
    @player1.set_answer
    print PLAYER_1
    respond(@player1)
    current_score
    puts "----- NEW TURN -----"
    @question.refresh
    puts PLAYER_2 + ": What does #{@question.addend_1} plus #{@question.addend_2} equal?"
    @player2.set_answer
    print PLAYER_2
    respond(@player2)
    current_score
    #byebug
    # @player1.inspect
    # @player2.inspect
    puts (is_playing? ? "----- NEW TURN -----" : "----- WE HAVE A WINNER! -----")
  end

  def is_playing?
    @player1.still_alive? && @player2.still_alive? ? true : false    
  end

  def result
    winner = PLAYER_1
    if @player2.still_alive?
      winner = PLAYER_2
      puts winner << " wins with a score of #{@player2.current_lives}/3"
    else
      puts winner << " wins with a score of #{@player1.current_lives}/3"
    end
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  private 

  def current_score
    puts " P1: #{@player1.current_lives}/3 vs P2: #{@player2.current_lives}/3"
  end

  def respond(player)
    if (player.current_answer != @question.sum)
      player.lose_life
      wrong_answer
    else
      right_answer
    end
  end
  
  def wrong_answer()
    print ": Seriously? No!"
  end

  def right_answer()
    print ": YES! You are correct."
  end

end
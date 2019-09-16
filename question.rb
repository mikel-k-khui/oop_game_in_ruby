# Generate random numbers and 
# @State: 
# @Behaviour(s):
# initialize with two random numbers between 1 and 20 and answer as read-only instance variables
# refresh with new answers
class Question
  attr_accessor :addend_1, :addend_2, :sum

  def initialize
    refresh
  end

  def refresh
    @addend_1 = rand(1..20)
    @addend_2 = rand(1..20)
    @sum = @addend_1 + @addend_2
  end

end
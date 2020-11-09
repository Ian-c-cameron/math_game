class Question
  def initialize
    @N1 = rand(1..20)
    @N2 = rand(1..20)
    @OPERATOR = rand(4)
    @OPERATORS = ["plus", "minus", "multiplied by", "divided by"]
    @RESULTS = [@N1 + @N2, @N1 - @N2, @N1 * @N2, @N1 / @N2]
  end
  def to_s
    "What does #{@N1} #{@OPERATORS[@OPERATOR]} #{@N2} equal?"
  end
  def check_answer(answer)
    "#{@RESULTS[@OPERATOR]}" == answer
  end
end
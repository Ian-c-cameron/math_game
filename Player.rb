class Player
  attr_reader :playing, :id
  def initialize (id, lives)
    @id = id
    @lives = lives
    @playing = true
    @TOTAL_LIVES = lives
  end

  def lose_life
    puts "Player #{@id}: Seriously? No!"
    @lives -= 1
  end

  def to_s
    "P#{@id}: #{@lives}/#{@TOTAL_LIVES}"
  end

  def lives
    "#{@lives}/#{@TOTAL_LIVES}"
  end

  def ask_question(question)
    puts "Player #{@id}: #{question}"
    answer = gets.chomp
    is_correct = question.check_answer(answer)
    if answer == 'q' || answer =='Q'
      @lives = 0
      @playing = false
      false
    elsif !is_correct
      if self.lose_life > 0 #lose_life returns lives remaining
        true
      else
        @playing = false
        false
      end
    else
      puts "Player #{@id}: YES! You Are Correct."
      true
    end
  end
end
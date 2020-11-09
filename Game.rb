class Game
  def initialize (num_players, num_lives)
    @players = []
    for i in 0..(num_players - 1)
      @players << Player.new(i, num_lives)
    end
    @still_playing = num_players
    @turn = 0
  end

  def start
    puts "Welcome to Mighty Math!!"
    while @still_playing > 1
      if @players[@turn].playing
        puts "----- NEW TURN -----"
        if !@players[@turn].ask_question(Question.new)
          @still_playing -= 1
        end
        puts self
        self.next_turn
      end
    end
    winner = self.get_winner
    puts "Player #{winner.id} wins with a score of #{winner.lives}"
    puts "----- GAME OVER -----"
  end

  def next_turn
    @turn += 1
    if @turn == @players.length
      @turn = 0
    end
  end

  def get_winner
    #return the player who is still playing
    @players.select { |player| player.playing }[0]
  end

  def to_s
    output = "#{@players[0]}"
    for i in 1..(@players.length - 1)
      output += " vs. #{@players[i]}"
    end
    output
  end
end
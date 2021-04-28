class Game

  def initialize
    @player1 = Player.new("p1")
    @player2 = Player.new("p2")
    @current_player  = @player1
    @opponent = @player2
  end

  def start
    puts "-----  NEW TURN -----"
    self.turn
  end

  def turn
    question_one = Question.new
    question_one.generate_question
    print "> "
    user_answer = gets.chomp
    result = question_one.check_answer?(user_answer)

    if result
      puts "Correct Answer!"
      puts
    else
      puts "Sorry, Incorrect"
      @current_player.loose_life
    end

    status = @current_player.game_over?
  
    if status
      puts "*****  Game Over  *****"
      puts "Player #{@opponent.name} Wins!"
      puts
      return
    else
      puts "Player 1: #{@player1.lives} / 3 vs Player 2: #{@player2.lives} / 3 "
      puts

      if @current_player == @player1
        @current_player = @player2
        @opponent = @player1
        self.turn
      else
        @current_player = @player1
        @opponent = @player2
        puts "******  Turn Over  ******"
        self.start
      end
    end
  end
 
end

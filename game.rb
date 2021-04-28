class Game

  def initialize
    @player1 = Players.new("p1")
    @player2 = Players.new("p2")
    @current_player  = @player1
  end

  def start
    self.turn
  end

  def turn
    puts "-----  NEW TURN -----"
    question_one = Question.new
    question_one.generate_question
    print "> "
    user_answer = gets.chomp
    result_one = question_one.check_answer(user_answer)

    if result_one
      puts "Correct Answer!"
    else
      puts "Sorry, Incorrect"
      @current_player.loose_life
    end

    status = @current_player.game_over?
    if status
      puts "*****  Game Over  *****"
      puts "Player 2 Wins!"
    else
      puts "Player 1: #{@player1.lives} / 3 vs Player 2: #{@player2.lives} / 3 "
      puts "******  Turn Over  ******"

      if current_player == @player1
        current_player = @player2
      else
        current_player = @player1
      end

      self.start
    end

  end
end

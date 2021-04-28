class Player
  attr_reader :lives

  def initialize(name)
    @name = name
    @lives = 3
    puts "initialized player"
  end

  def loose_life
    @lives -= 1
  end

  def game_over?
    @lives == 0
  end
end


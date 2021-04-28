class Player
  attr_reader :lives, :name

  def initialize(name)
    @name = name
    @lives = 3
    puts
  end

  def loose_life
    @lives -= 1
  end

  def game_over?
    @lives == 0
  end
end


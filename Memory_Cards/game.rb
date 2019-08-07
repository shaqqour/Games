#shaqqour
require_relative "board"
require "colorize"

class Game

  def initialize
    @board = Board.new
  end

  def play
    @board.populate
    moves = 0
    until @board.won?
      moves += 1
      turn
    end
    puts "YOU WON in #{moves} moves"
  end

  def turn
    system "clear"
    @board.render
    puts "Enter your first move in the format of e.g. '0 1'"
    play_1 = user_input
    card_1 = @board.grid[play_1[0]][play_1[1]]
    card_1.reveal
    system "clear"
    @board.render
    puts "Enter your second move in the format of e.g. '0 1'"
    play_2 = user_input
    card_2 = @board.grid[play_2[0]][play_2[1]]
    card_2.reveal
    system "clear"
    @board.render
    if card_1 == card_2
      puts "Thats a match!"
    else
      puts "Thats not a match try again!"
      card_1.hide
      card_2.hide
    end
    sleep 1.5
  end

  def user_input
    valid = false
    until valid
      input = gets.chomp
      if input == "cheat"
        puts @board.cheat
        sleep 5
        input = gets.chomp
      end
      input = input.split.map!(&:to_i)
      if !valid_play?(input)
        puts "Please enter a valid move"
        next
      end
      valid = true
      return input
    end
  end

  def valid_play?(pos)
    return false if pos[0] > 3 || pos[1] > 3 || pos[0] < 0 || pos[1] < 0
    !@board.reavealed?(pos[0], pos[1])
  end

end

if __FILE__ == $PROGRAM_NAME
  new_game = Game.new
  new_game.play
end
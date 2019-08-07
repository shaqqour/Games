#shaqqour
require_relative 'card.rb'
require 'byebug'
class Board
  attr_reader :grid

  def initialize
    @grid = Array.new (4) { [Array.new(4)]}
  end

  def populate
    alpha = ("A".."Z").to_a.shuffle
    possible_spots = find_possible_spots
    i = 0
    while i < possible_spots.length
        letter = alpha.pop
        assign_letter(letter, possible_spots[i])
        i += 1
        assign_letter(letter, possible_spots[i])
        i += 1
    end
  end 

  def assign_letter(letter, spot)
    x, y = spot
    @grid[x][y] = Card.new(letter)
  end

  def reavealed?(x, y)
    @grid[x][y].displayed
  end

  def find_possible_spots
    Array.new(2, (0...@grid.length).to_a).flatten.combination(2).to_a.uniq.shuffle
  end

  def render
    puts "  | 0 | 1 | 2 | 3 |"
    puts "--+---+---+---+----"
    @grid.each_with_index do |row, i|
        r = row.map { |card| card.display_card_info }
        r.unshift(i)
        puts r.join(" | ") + " |"
        puts "--+---+---+---+----"
    end
  end

  def won?
    @grid.flatten.all? { |card| card.displayed }
  end

  def cheat
    str = ""
    @grid.each do |cards|
      cards.each { |card| str += card.to_s }
      str += "\n"
    end
    str
  end

end
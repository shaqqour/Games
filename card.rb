#shaqqour
class Card
    attr_reader :displayed

  def initialize(letter)
    @letter = letter
    @displayed = false
  end

  def hide
    @displayed = false
  end

  def reveal
    @displayed = true
  end

  def to_s
    @letter
  end

  def ==(other_card)
    @letter == other_card.to_s
  end

  def display_card_info
    @displayed ? @letter.to_s : ' '
  end
end
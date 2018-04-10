class Card
  
  VALUES = {ace:11, king: 10, queen: 10, jack: 10, 
           two: 2, three: 3, four: 4, five: 5, six: 6,
           seven: 7, eight: 8, nine: 9, ten: 10}

  attr_reader :suit, :rank, :number

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def to_s
    "Масть: #{@suit}. Номинал: #{@rank}. Кол-во очков #{VALUES[self.rank]}."
  end

  def value
    VALUES[self.rank]
  end

  def alter_value
    self.rank == :ace ? 1 : VALUES[self.rank]
  end
end
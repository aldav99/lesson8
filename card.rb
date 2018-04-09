class Card
  
  attr_reader :suit, :rank, :number

  def initialize(suit, rank, number)
    @suit = suit
    @rank = rank
    @number = number
  end

  def to_s
    "Масть: #{@suit}. Номинал: #{@rank}. Кол-во очков #{@number}."
  end

  def add(value)
    if self.number == 10
      (value + self.number)  > 21  ? value + 1 : value + 10
    else
      value + self.number
    end
  end

  def self.score(cards)
    sum = 0
    cards.each do |card|
      if card.number == 10
        sum  > (21 - 10) ? sum += 1 : sum += 10
      else
        sum += card.number
      end
    end
    sum
  end
end
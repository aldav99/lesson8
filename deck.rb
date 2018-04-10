class Deck
  
  SUITS = [:heart, :diamond, :club, :spade]
  
  RANKS = [:ace, :king, :queen, :jack, 
           :two, :three, :four, :five, :six,
           :seven, :eight, :nine, :ten]
  
  def initialize
    @cards ||= []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(suit, rank)
      end
    end
    @cards.shuffle!
  end

  def number_cards
    @cards.length
  end

  def pick
    @cards.shift
  end
end
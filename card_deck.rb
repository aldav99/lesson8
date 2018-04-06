class CardDeck
  def deck
  { "2+" => 2, "2<" => 2, "2^"=> 2, "2<>" => 2,
    "3+" => 3, "3<" => 3, "3^"=> 3, "3<>" => 3,
    "4+" => 4, "4<" => 4, "4^"=> 4, "4<>" => 4,
    "5+" => 5, "5<" => 5, "5^"=> 5, "5<>" => 5,
    "6+" => 6, "6<" => 6, "6^"=> 6, "6<>" => 6,
    "7+" => 7, "7<" => 7, "7^"=> 7, "7<>" => 7,
    "8+" => 8, "8<" => 8, "8^"=> 8, "8<>" => 8,
    "9+" => 9, "9<" => 9, "9^"=> 9, "9<>" => 9,
    "10+" => 10, "10<" => 10, "10^"=> 10, "10<>" => 10,
    "J+" => 10, "J<" => 10, "J^"=> 10, "J<>" => 10,
    "Q+" => 10, "Q<" => 10, "Q^"=> 10, "Q<>" => 10,
    "K+" => 10, "K<" => 10, "K^"=> 10, "K<>" => 10,
    "A+" => 10, "A<" => 10, "A^"=> 10, "A<>" => 10 }
  end

  def deck_current
    @deck_current ||= deck.keys
  end

  def pick_card_player
    @pick_card_player ||= []
  end

  def pick_card_diler
    @pick_card_diler ||= []
  end

  def show(whose)
    case whose
    when :player
      puts "Ваши карты #{pick_card_player}"
      puts "Ваши очки: #{score(pick_card_player)}"
    when :diler
      puts "Карты дилера #{pick_card_diler}"
      puts "Очки дилера: #{score(pick_card_diler)}"
    end
  end

  def pick(whose)
    card = deck_current.shuffle.shift
    deck_current.delete card
    case whose
    when :player
      pick_card_player << card
    when :diler
      pick_card_diler << card
    end
  end

  def score(arr)
    sum = 0
    arr.each do |card|
      if ["A+", "A<", "A^", "A<>"].include? card
        sum  > (21 - 10) ? sum += 1 : sum += 10
      else
        sum += deck[card]
      end
    end
    sum
  end
end
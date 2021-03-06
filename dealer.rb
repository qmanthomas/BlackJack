require_relative 'deck'
require_relative 'player'
 
class Dealer
  
    attr_accessor :dealer_score
  
  def intialize(dealer_score=0, player_cards=[], dealer_cards=[])
    @dealer_score = dealer_score
    @player_cards = player_cards
    @dealer_cards = dealer_cards
  end
  
  
  def say_intro(player_name)
     puts "Welcome to Blackjack!"
     puts ""
     puts "Make your selection #{player_name}. You can choose whether to hit or stay"
     puts "-----Enter 1 to hit  -----"
     puts "-----Enter 2 to stay -----"
     puts "-----Enter 3 to quit -----"
     
  end
  
  def say_players_card_value_total
    puts "Your current card value total is #{@starting_player_hand}" 
  end
  
  
  def deal_cards
      Deck.shuffle
      player_cards = select_player_cards
      dealer_cards = select_dealer_cards
  end
  
  def self.calculate_player_hand_count(player_cards)
    player_cards.inject{|sum,x| sum + x}
    puts "Your total card amount is #{sum.to_s}"
    #return sum
  end
  
  def get_dealer_total
    dealer_score = dealer_cards.inject{|sum, x| sum + x}
  end
  
  def determine_winner
    if :dealer_score > :player_score || :dealer_score == 21 
      puts "Sorry, you lose! Better luck Next Time"
    elsif :dealer_score > 21 
      puts "Congratualtions You have Won!"
    end
      
  end
  
  def ask_player_to_play_again
    puts "Would You like to Play again?"
    answer = gets.chomp
    answer.downcase
    if answer == "no"
      Player.quit
      elsif answer == "yes"
        puts"Enter 1 to hit, Enter 2 to stay, Enter 3 to quit"
        else
          puts "You must Enter Yes or No"
      end 
  end
  
end
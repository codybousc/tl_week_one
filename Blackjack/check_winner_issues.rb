#require 'pry'

def calc_total(cards)
arr = cards.map {|e| e[0]} 
total = 0
arr.each do |value|
  if value == "Ace"
    total += 11
  elsif value.to_i == 0
    total += 10
  else 
    total += value.to_i
  end
end

  #correct for Aces
  arr.select{|e| e == "Ace"}.count.times do
    total -= 10 if total > 21
end

total
end

# binding.pry


suit = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']

deck = cards.product(suit)

deck.shuffle!

#Deal cards

my_cards = [] 
dealer_cards = []
my_cards << deck.pop
dealer_cards << deck.pop
my_cards << deck.pop
dealer_cards << deck.pop

my_total = calc_total(my_cards)
dealer_total = calc_total(dealer_cards)


def check_winner(my_total, dealer_total)
  if my_total > 21
        abort("CWCW ! House wins!")     
  elsif my_total == 21
        abort("CWCW ! BLACKJACK! YOU WIN!")
  elsif dealer_total > 21
        puts "CWCW ! Dealer BUST! You win!"     
  elsif dealer_total == 21
        puts "CWCW BLACKJACK! House wins!!"
  end
end

check_winner(my_total, dealer_total)

#Show Cards

puts "==============================================================================="
puts " "
puts "Dealer has: #{dealer_cards[0]} and #{dealer_cards[1]} for a total of: #{dealer_total}"
puts "==============================================================================="
puts " "
puts "You have #{my_cards[0]} and #{my_cards[1]} for a total of: #{my_total}"

#Player Turn 
begin
  my_total = calc_total(my_cards)
  new_card = my_cards.last
  puts "==============================================================================="
  puts " "
  puts "Would you like to hit or stay? Type 1) to hit Type 2) to stay"

  hit_or_stay = gets.chomp.to_i
    if hit_or_stay == 1
    my_cards << deck.pop
    puts "Your new card is a #{my_cards.last}"
    puts "Your new total is: #{calc_total(my_cards)}"
    end
    check_winner(my_total, dealer_total)
      
end until hit_or_stay == 2

#Dealer's Turn

puts "Dealer's current total is #{calc_total(dealer_cards)}"

begin
  
  if calc_total(dealer_cards) < 17
      dealer_total = calc_total(dealer_cards)
      dealer_cards << deck.pop
      puts "Dealer hits!"
      puts "Dealer's new card is a #{dealer_cards.last}"
      puts "Dealer's new total is: #{calc_total(dealer_cards)}"
      puts "==============================================================================="
  end    
    
end until calc_total(dealer_cards) > 17

check_winner(my_total, dealer_total)

puts "Made it to the end!"

#Compare Player & Dealer's Cards 




  

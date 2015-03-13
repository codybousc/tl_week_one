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

#Get Name

puts "Welcome to Blackjack!"
puts "What's your name?"
name = gets.chomp 

dealers = ['Michael', 'Tony', 'Scott', 'Frederico']
dealers.shuffle!
dealer_name = dealers.pop
puts " "
puts "Well hello #{name}, #{dealer_name} will be your dealer today!"

#Show Cards

puts "==============================================================================="
puts " "
puts "#{dealer_name} has: #{dealer_cards[0]} and #{dealer_cards[1]} for a total of: #{dealer_total}"
puts "==============================================================================="
puts " "
puts "#{name}, you have #{my_cards[0]} and #{my_cards[1]} for a total of: #{my_total}"

#Player Turn 
begin
  my_total = calc_total(my_cards)
  new_card = my_cards.last
  puts "==============================================================================="
  puts " "
  puts "Ok #{name}, would you like to hit or stay? Type 1) to hit Type 2) to stay"

  hit_or_stay = gets.chomp.to_i
    if ![1, 2].include?(hit_or_stay)
      puts "Please enter 1 or 2"
    end
    if hit_or_stay == 1
      my_cards << deck.pop
      my_total = calc_total(my_cards)
      puts "Your new card is a #{my_cards.last}"
      puts "Your new total is: #{my_total}"
    end
    if calc_total(my_cards) > 21
      abort("BUST! House wins!")
        
    elsif calc_total(my_cards) == 21
      abort("BLACKJACK! YOU WIN!")
    end
end until hit_or_stay == 2

#Dealer's Turn

puts "#{dealer_name}'s current total is #{calc_total(dealer_cards)}"

begin
  
  if calc_total(dealer_cards) < 17
    dealer_cards << deck.pop
    puts ""
    puts "#{dealer_name}'s new card is a #{dealer_cards.last}"
    puts "#{dealer_name}'s new total is: #{calc_total(dealer_cards)}"
    puts "==============================================================================="

  end    
  if calc_total(dealer_cards) > 21
    abort("#{dealer_name} BUST! You win, #{name}!")
        
  elsif calc_total(dealer_cards) == 21
    abort("BLACKJACK! #{dealer_name} wins!!")
        
  end
end until calc_total(dealer_cards) >= 17

#Compare Player & Dealer's Cards 

if calc_total(my_cards) == calc_total(dealer_cards)
  puts "It's a tie!"
elsif calc_total(my_cards) > calc_total(dealer_cards)
  puts "You win!"
else
  puts "House wins!"
end
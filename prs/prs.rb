#Player choses between p, r, s
#comp 'choses'
#compare
#play again


CHOICES = {'p' => "Paper", 'r' => "Rock", 's' => "Scissors"}

def computer_winning_message(winning_choice)
  case winning_choice
  when 'p'
    puts "Computer chose Paper. Paper smothers Rock!"
  when 'r'
    puts "Computer chose Rock. Rock demolishes Scissors!"
  when 's'
    puts "Computer chose Scissors. Scissors dice Paper!"
  end
end

def player_winning_message(winning_choice)
  case winning_choice
  when 'p'
    puts "You chose Paper. Paper smothers Rock!"
  when 'r'
    puts "You chose Rock. Rock demolishes Scissors!"
  when 's'
    puts "You chose Scissors. Scissors dice Paper!"
  end
end


loop do
#Player choses 
  begin
    puts "Enter choice: p, r or s!"
    player_choice = gets.chomp

  end until CHOICES.keys.include?(player_choice)

#Computer choses
computer_choice = CHOICES.keys.sample 

if player_choice == computer_choice
  puts "It's a tie!"
  puts "The gods have allowed you another game!"

#Compare
elsif (player_choice == 'p' && computer_choice == 'r') || (player_choice == 'r' && computer_choice == 's') || (player_choice == 's' && computer_choice == 'p')

  puts "You win!"
  puts player_winning_message(player_choice)

else
  puts "Computer won!"
  puts computer_winning_message(computer_choice)
 
end
end







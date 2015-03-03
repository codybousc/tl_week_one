


def initialize_board
  b = {}
  (1..9).each {|position| b[position] = ' '}
  b 
end




def draw_board(b)
  system 'clear'
  puts " #{b[1]} | #{b[2]}   | #{b[3]}   |"
  puts "_______________"
  puts " #{b[4]} | #{b[5]}   | #{b[6]}   |"
  puts "_______________"
  puts " #{b[7]} | #{b[8]}   | #{b[9]}   |"
end


def player_pick_square(b)
  begin
    puts "Pick a position, my friend! (1 through 9)"
    position = gets.chomp.to_i
    valid_choice = empty_positions(b).include? position
    if !valid_choice
      puts "Please chose an empty square!"
    end 
  end until valid_choice

b[position] = 'X'
end

def empty_positions(b)
  b.select {|key, value| value == ' '}.keys
end

def computer_picks_square(b)
  position = empty_positions(b).sample
  b[position] = 'O'
end


def check_winner(board)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    return "Player" if board.values_at(*line).count('X') == 3 #confused by splat here. potentially used instead of writing in all different options?
    return "Computer" if board.values_at(*line).count('O') == 3
  end
  nil
end

    
begin

board = initialize_board #not sure what this does, or why we're setting it equal to board. 
# maybe so that we could access it in the 'local scope?' i think it allows us to print out the hash b

begin
  draw_board(board)
  player_pick_square(board)
  draw_board(board)
  winner = check_winner(board)
  computer_picks_square(board)
  winner = check_winner(board)
end until winner || empty_positions(board).empty?

if winner == 'Player'
  puts "You won!"
elsif winner == 'Computer'
  puts "Computers will soon run the land!"
else 
  puts "It's a tie!"

end



puts "Would you like to play again? (y/n)"
play_again = gets.chomp.downcase
end until play_again != 'y'
puts "Adios!"










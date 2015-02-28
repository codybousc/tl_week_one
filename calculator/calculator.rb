#add pseudo in separate file.

puts "What's your first number?"
num1 = gets.chomp

puts "What's your second number?"
num2 = gets.chomp

puts "If you'd like to:
add, type 1 
subtract, type 2 
multiply, type 3
divide, type 4"
 process = gets.chomp

  if process == '1'
  answer = num1.to_i + num2.to_i
elsif process == '2'
  answer = num1.to_i - num2.to_i
elsif process == '3'
  answer = num1.to_i * num2.to_i
elsif process == '4'
  answer = num1.to_f / num2.to_f
else 
  puts "Ahh, you're looking for a scientific calculator! Make a choice between 1 and 4, please!"
end

puts "Your answer is #{answer}!"


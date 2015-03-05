#take two numbers from user
#ask whether they want to add, subtract, divide or multiply them
#print out answer

  







begin
  puts "================================="
  puts "Please enter your first number!"
  num1 = gets.chomp

  puts "================================="
  puts "Please enter your second number!"
  num2 = gets.chomp

  puts "================================="
  puts "To add the numbers, Enter 1"
  puts "To subtarct the numbers, Enter 2"
  puts "To multiply the numbers, Enter 3"
  puts "To divide the numbers, Enter 4"
  formula = gets.chomp.to_i  

  if formula == 1
    result = num1.to_i + num2.to_i
  elsif formula == 2
    result = num1.to_i - num2.to_i
  elsif formula == 3
    result = num1.to_i * num2.to_i
  elsif formula == 4
    result = num1.to_f / num2.to_f
  end

  puts "================================="
  puts ""
  puts "The correct answer is #{result}"

  puts "Would you like to solve another problem? Enter (y/n)"
  answer = gets.chomp 
end until answer != 'y'



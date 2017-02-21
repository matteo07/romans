require_relative '../lib/tasks/arab_roman'
require_relative '../lib/exceptions/invalid_character_exception'
require_relative '../lib/exceptions/invalid_order_exception'

while true
  puts "Write your number to convert (q to exit)"
  input = gets.chomp
  if input == "q"
    break
  end
  begin
    puts input + " converted is " + ArabRoman.convert(input).to_s
  rescue InvalidOrderException
    puts input + " has roman numbers in the wrong order"
  rescue InvalidCharacterException
    puts input + " contains characters that are not roman numbers"
  end
end
p 'Bye'

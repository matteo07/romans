require_relative '../lib/tasks/arab_roman'

while true
  puts "Write your number to convert (q to exit)"
  input = gets.chomp
  if input == "q"
    break
  end
  begin
    puts input + " converted is " + ArabRoman.convert(input).to_s
  rescue
    puts input + " is not a valid roman number format"
  end
end
p 'Bye'

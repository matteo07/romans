require_relative '../lib/tasks/arab_roman'

while true
  puts "Write your number to convert (q to exit)"
  input = gets.chomp.to_s
  if input == "q"
    break
  end
  puts input + " converted is " + ArabRoman.convert(input).to_s
end
p 'Bye'



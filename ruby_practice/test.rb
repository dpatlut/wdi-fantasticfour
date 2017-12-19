


def meaning_of_life
  return 42
end

puts "Do you want to know the meaning of life?"
user_wants_to_know = gets.chomp
if(user_wants_to_know == "y")
  puts meaning_of_life
else
  puts "Oh, how disappointing!"
end



# Helper app for creating words in Spindi Translate

puts "SpindiTranslate create words here. Type 'quit' when asked for spindi word to exit."

words_array = []

while true do
  puts "Enter spindi word:"
  spindi = gets.chomp
  break if spindi == 'quit'
  puts "Enter bg translation for #{spindi}:"
  bg = gets.chomp
  words_array << "Word.create(spindi: \"#{spindi}\", bg: \"#{bg}\") unless Word.exists?(spindi: \"#{spindi}\")"
end

words_array = words_array.uniq

open('create_words.txt', 'a') do |f|
  words_array.each do |row|
    f.puts row
  end
end

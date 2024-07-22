class OddWords
  def self.transform(str)
    phrase = ''
    word = ''
    odd = false
    str.each_char do |char|
      word << char if char.match?(/[A-Za-z]/)
      if char.match?(/[ .]/)
        raise ArgumentError('bad input') if word.length > 20
        odd ? phrase << word.reverse + char : phrase << word + char
        word.clear
        odd = !odd
      end
    end
    phrase
  end
end

puts OddWords.transform("whats the matter with kansas.") ==
  "whats eht matter htiw kansas."

begin
  OddWords.transform("I don't believe in antidisestablishmentarianism")  
rescue ArgumentError => e
  puts e
end


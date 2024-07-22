# anagrams.rb


# anagrams.rb

class Anagram
  attr_reader :subject

  def initialize(word)
    @subject = word
  end

  def match(word_list)
    word_list.select do |word|
      word.downcase.chars.sort == subject.downcase.chars.sort &&
      word.downcase != subject
    end
  end
end

# subject = Anagram.new('listen')
# p subject.match(["enlists", "google", "inlets", "banana"])

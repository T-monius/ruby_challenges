# anagrams.rb

class Anagram
  def initialize(word)
    self.target = word
  end

  def match(words)
    sorted_target = Anagram.sorted_chars(target)
    found = words.select do |word|
      word.size == target.size &&
        word.downcase != target.downcase &&
        Anagram.sorted_chars(word) == sorted_target
    end
    found
  end

  def self.sorted_chars(word)
    word.downcase.chars.sort
  end

  protected
  attr_accessor :target
end

# word_count.rb

# This class takes an input string and parses it for words.
# The words can be counted and a tally returned in a hash with
# instance method `Phrase#word_count`.
class Phrase
  def initialize(str)
    self.words = str.downcase.scan(VALID_WORD)
  end

  def word_count
    words.each_with_object(Hash.new(0)) do |w, tally|
      tally[w] += 1
    end
  end

  private

  VALID_WORD = /\b\w+'?\w+|\w+\b/
  attr_accessor :words
end

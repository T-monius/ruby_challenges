# scrabble_score1.rb

class Scrabble
  LETTER_SCORES = { /[aeioulnrst]/i => 1, /[dg]/i => 2, /[bcmp]/i => 3,
                    /[fhvwy]/i => 4, /[k]/i => 5 , /[jx]/i => 8,
                    /[qz]/i => 10 }
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def score
    return 0 if word.nil?
    values = LETTER_SCORES.map do |regx, value|
      matches = word.scan(regx).count
      matches * value
    end
    values.sum
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

p Scrabble.new(nil).score

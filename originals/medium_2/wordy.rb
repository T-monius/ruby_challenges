# wordy.rb

class WordProblem
  ACCEPTABLE_WORDS = /plus|minus|divided|multiplied|-?\d+/
  COMPUTATIONS = { 'plus' => '+', 'minus' => '-', 'divided' => '/',
                   'multiplied' => '*' }
  attr_accessor :word_problem

  def initialize(str)
    self.word_problem = str.scan(ACCEPTABLE_WORDS)
  end

  def answer
    computations = acceptable_actions
    ints = just_the_numbers
    raise ArgumentError if computations.any? do |computation|
      !COMPUTATIONS.keys.include?(computation)
    end || computations.empty?

    computations.each do |computation|
      arg1 = ints.shift
      arg2 = ints.shift
      result = arg1.send(COMPUTATIONS[computation], arg2)
      ints.unshift(result)
    end
    ints.pop
  end

  private

  def just_the_numbers
    word_problem.select do |word|
      word.to_i.to_s == word
    end.map(&:to_i)
  end

  def acceptable_actions
    word_problem.select do |word|
      COMPUTATIONS.key?(word)
    end
  end
end

# palindrome_products.rb

class Palindrome
  include Comparable
  attr_accessor :value, :factors

  def initialize(value, factors)
    self.value = value
    self.factors = [] + factors.to_a
  end

  def <=>(other_palindrome)
    value <=> other_palindrome.value
  end
end

class Palindromes
  attr_accessor :spread, :all, :palindrome_objects

  def initialize(factor_min_max)
    default = {max_factor: 1, min_factor: 1}
    factors = default.merge(factor_min_max)
    self.spread =(factors[:min_factor]..factors[:max_factor])
    self.all = Hash.new([])
    self.palindrome_objects = []
  end

  def generate
    palindromic_factors.each do |factors|
      all[factors.reduce(:*)] += [factors]
    end
    self.palindrome_objects = all.map do |int, factors|
      Palindrome.new(int, factors)
    end
  end

  def largest
    palindrome_objects.max
  end

  def smallest
    palindrome_objects.min
  end

  private

  def palindrome?(int)
    int.to_s == int.to_s.reverse
  end

  def palindromic_factors
    spread.to_a.repeated_combination(2).to_a
      .select { |factors| palindrome?(factors.reduce(:*)) }
  end
end

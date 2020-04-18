# pythagorean_triplet.rb

class Triplet
  def initialize(a, b, c)
    self.a = a
    self.b = b
    self.c = c
  end

  def sum
    [a, b, c].sum
  end

  def product
    [a, b, c].reduce(:*)
  end

  def pythagorean?
    a**2 + b**2 == c**2
  end

  def self.where(sum: nil, min_factor: 0, max_factor:)
    combinations = (min_factor..max_factor).to_a.combination(3).to_a
    combinations = combinations.each.with_object([]) do |arr, triplets|
      triplet = Triplet.new(arr[0], arr[1], arr[2])
      triplets << triplet if triplet.pythagorean?
    end
    return combinations.select { |triplet| triplet.sum == 180 } if sum
    combinations
  end

  private

  attr_accessor :a, :b, :c
end

# series.rb

# Arbitrary comment
class Series
  attr_reader :string_identifier, :digits_arr
  def initialize(string_num)
    @string_identifier = string_num
    @digits_arr = string_num.chars.map(&:to_i)
  end

  def slices(int)
    raise ArgumentError if int > string_identifier.length
    return_array = []
    digits_arr.each_with_index do |_, idx|
      final_index = idx + int - 1
      break if final_index >= digits_arr.size
      slice = digits_arr[idx..final_index]
      return_array << slice
    end
    return_array
  end
end

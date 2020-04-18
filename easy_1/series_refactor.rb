# series_refactor.rb

# arbitrary comment
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

  # def slices(int)
  #   raise ArgumentError if int > string_identifier.length
  #   idx = 0
  #   digits_arr.each_with_object([]) do |_, obj|
  #     final_index = idx + int - 1
  #     break if final_index >= digits_arr.size
  #     slice = digits_arr[idx..final_index]
  #     obj << slice
  #     idx += 1
  #   end
  # end

# Original
  # def slices(int)
  #   raise ArgumentError if int > string_identifier.length
  #   return_array = []
  #   idx = 0
  #   loop do
  #     final_index = idx + int - 1
  #     break if final_index >= digits_arr.size
  #     slice = digits_arr[idx..final_index]
  #     return_array << slice
  #     idx += 1
  #   end
  #   return_array
  # end
end

sr = Series.new('01234')
p sr.slices(1)

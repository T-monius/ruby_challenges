# run_length_encoding.rb

class RunLengthEncoding
  def self.encode(str)
    encoded_str = ''
    parse_for_runs(str).each do |run|
      encoded_str << "#{run.count if run.count > 1}#{run[0]}"
    end
    encoded_str
  end

  def self.decode(str)
    str.scan(/\d*./).each_with_object('') do |code, decoded_str|
      if code.size == 1
        decoded_str << code
        next
      end
      num = code.match(/\d*/).to_s.to_i
      decoded_str << code[-1] * num if num
    end
  end

  def self.parse_for_runs(str)
    arr = str.chars
    all_runs = []
    loop do
      break if arr.empty?
      first_element = arr[0]
      run = arr.take_while { |ele| ele == first_element }
      all_runs << run
      arr.shift(run.size)
    end
    all_runs
  end
end

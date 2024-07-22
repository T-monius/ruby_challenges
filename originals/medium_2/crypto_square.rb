# crypto_square.rb

class Crypto
  attr_accessor :plaintext_segments, :encrypted_arr

  def initialize(str)
    self.str = str
    normalize_plaintext
    self.plaintext_segments = segment(str)
  end

  def normalize_plaintext
    str.downcase!
    str.delete!('^0-9a-z')
    str
  end

  def size
    plain_text_size = str.size
    Math.sqrt(plain_text_size).ceil
  end

  def ciphertext
    new_str = ''
    idx = 0
    loop do
      break if idx == plaintext_segments[0].length
      plaintext_segments.each do |word|
        new_str << word[idx] if word[idx]
      end
      idx += 1
    end
    new_str
  end

  def normalize_ciphertext
    new_str = ciphertext.clone
    arr = []
    offset = Math.sqrt(new_str.length).floor - 1
    loop do
      break if new_str.empty?
      if new_str.length > offset
        arr << new_str.slice!(0..offset)
      else
        arr << new_str.slice!(0..-1)
      end
    end
    arr.join(' ')
  end

  private

  attr_accessor :str

  def segment(str)
    new_str = str.clone
    arr = []
    offset = size - 1
    loop do
      break if new_str.empty?
      if new_str.length > offset
        arr << new_str.slice!(0..offset)
      else
        arr << new_str.slice!(0..-1)
      end
    end
    arr
  end
end

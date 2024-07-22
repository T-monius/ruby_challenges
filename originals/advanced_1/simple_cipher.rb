# simple_cipher.rb

class Cipher
  attr_accessor :key

  def initialize(str="ddddddddddddddddd")
    raise ArgumentError unless str.match?(/\A[a-z]+\z/)
    self.key = str
  end

  def encode(text, operator= :+)
    key_codepoints = key.codepoints
    new_codepoints = []

    text.codepoints.each_with_index do |current_codepoint, i|
      offset = key_codepoints[i] % 'a'.ord
      new_codepoint = 0
      case operator
      when :+
        new_codepoint = current_codepoint + offset
        new_codepoint = (new_codepoint % 122) + 96 if new_codepoint > 122
      when :-
        new_codepoint = current_codepoint - offset
      end
      new_codepoints << new_codepoint
    end

    new_codepoints.map(&:chr).join
  end

  def decode(encoded_text)
    encode(encoded_text, :-)
  end
end

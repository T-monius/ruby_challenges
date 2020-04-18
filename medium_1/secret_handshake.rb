# secret_handshake.rb

# This class stores an input to represent a sequence of events
# represented in a binary. The `commands` instance method
# creates an array of the sequence of events.
class SecretHandshake
  def initialize(input)
    if input.instance_of?(Integer)
      self.binary = input.to_s(2)
    elsif valid_binary?(input)
      self.binary = input
    else
      self.binary = '0'
    end
  end

  def commands
    handshake = []
    sequence = 0
    binary.reverse.each_char do |char|
      if sequence <= 3
        handshake << SHAKES[sequence] if char == '1'
        sequence += 1
      else
        handshake.reverse! if char == '1'
        sequence = 0
      end
    end
    handshake
  end

  private

  attr_accessor :binary

  SHAKES = { 0 => 'wink', 1 => 'double blink',
             2 => 'close your eyes', 3 => 'jump' }.freeze

  def valid_binary?(input)
    input.match?(/[01]/)
  end
end

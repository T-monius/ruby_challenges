# circular_buffer.rb

class BufferObject
  attr_accessor :stamp, :time_stamp

  def initialize(object='empty')
    self.stamp = object
    self.time_stamp = Time.new
  end

  def <=>(other_object)
    time_stamp <=> other_object.time_stamp
  end

  def to_s
    "#{stamp}"
  end
end

class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  attr_accessor :buffer, :buffer_length, :add_at_index

  def initialize(buffer_length)
    self.buffer_length = buffer_length
    self.buffer = Array.new(buffer_length, BufferObject.new)
    self.add_at_index = (0...buffer_length).to_a.sample
  end

  def write(obj)
    raise BufferFullException if full?
    add(obj) unless obj.nil?
  end

  def write!(obj)
    return if obj.nil?
    return write(obj) if !full?
    oldest_object = find_oldest_object
    oldest_index = buffer.find_index(oldest_object)
    buffer[oldest_index] = BufferObject.new(obj)
  end

  def read
    raise BufferEmptyException if empty? 
    oldest_object = find_oldest_object
    oldest_index = buffer.find_index(oldest_object)
    buffer[oldest_index] = BufferObject.new('empty')
    oldest_object.to_s
  end

  def clear
    empty_buffer = Array.new(buffer_length, BufferObject.new('empty'))
    buffer.replace(empty_buffer)
  end

  def to_s
    "#{buffer.map(&:to_s)}"
  end

  private

  def empty?
    buffer.all? { |ele| ele.stamp == 'empty' }
  end

  def full?
    buffer.none? { |ele| ele.stamp == 'empty' }
  end

  def []=(idx, obj)
    buffer[idx]= obj
  end

  def [](idx)
    buffer[idx]
  end

  def add(obj)
    buffer[add_at_index]= BufferObject.new(obj)
    next_index
  end

  def next_index
    self.add_at_index = (add_at_index + 1) % buffer_length
  end

  def find_oldest_object
    ordered_by_age = buffer.sort
    only_non_empties = ordered_by_age.select { |obj| obj.stamp != 'empty' }
    only_non_empties[0]
  end
end

# CircularBuffer.new(1).read
# buffer = CircularBuffer.new(3)
# buffer.write('1')
# buffer.write('2')
# buffer.write('A')
# begin
#   buffer.write('4')
# rescue StandardError => e
#   puts "Can't write now"
# end
# puts buffer
# puts buffer.find_oldest_object

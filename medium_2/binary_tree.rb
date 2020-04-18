# binary_tree.rb
require 'pry'

class Bst
  @@buffer = []
  include Comparable
  attr_reader :data, :right, :left

  def initialize(value)
    @data = value
  end

  def insert(value)
    value.instance_of?(Bst) ? new_data = value : new_data = Bst.new(value)
    if new_data <= self
      left ? left.insert(new_data) : self.left = new_data
    else
      right ? right.insert(new_data) : self.right = new_data
    end
  end

  # def each
  #   left.each if left
  #   @@buffer << self.data
  #   right.each if right
  #   @@buffer.each { |bst_instance| yield(bst_instance) } if block_given?
  #   @@buffer.clear if block_given?
  #   self if block_given?
  #   @@buffer.to_enum unless block_given?
  # end

  def each(&block)
    return enum_for(:each) unless block_given?
    
    left.each(&block) if left
    block.call(data)
    right.each(&block) if right
  end

  def <=>(other_bst)
    data <=> other_bst.data
  end

  def self.clear_buffer
    @@buffer.clear
  end

  protected
  attr_writer :right, :left
end

# four = Bst.new(4)
# # p four
# four.insert(5)
# # p four
# four.insert(3)
# # p four
# four.insert(2)
# # p four
# # p four.left.left.data

# four.each { |datapoint| p datapoint }

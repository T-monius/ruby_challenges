# simple_linked_list.rb
require 'pry'

class Element
  attr_accessor :datum, :next

  def initialize(data, previous_element=nil)
    self.datum = data
    self.next = previous_element
  end

  def tail?
    return true if self.next.nil?
    false
  end
end

class SimpleLinkedList
  attr_accessor :elements_array

  def initialize
    self.elements_array = []
  end

  def size
    elements_array.size
  end

  def empty?
    elements_array.empty?
  end

  def push(el)
    elements_array << Element.new(el, elements_array.last)
  end

  def peek
    last = elements_array.last
    return last if last.nil?
    # binding.pry
    last.datum
  end

  def head
    elements_array.last
  end

  def pop
    elements_array.pop.datum
  end

  def to_a
    elements_array.map do |el|
      el.datum
    end.reverse
  end

  def reverse
    elements_array.reverse_each.with_object(SimpleLinkedList.new) do |el, reversed_arr|
      reversed_arr.push(el.datum)
    end
  end

  def self.from_a(arr)
    list = SimpleLinkedList.new
    return list if arr.nil?
    arr.reverse.each do |el|
      list.push(el)
    end
    list
  end
end

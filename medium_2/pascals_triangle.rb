# pascals_triangle.rb

class Triangle
  FIRST_ROW = [1]
  SECOND_ROW = [1, 1]
  attr_accessor :row_total, :triangle

  def initialize(rows)
    self.row_total = rows
    @triangle = [FIRST_ROW, SECOND_ROW]
  end

  def rows
    case row_total
    when 1
      [FIRST_ROW]
    when 2
      triangle
    when triangle.size
      triangle
    else
      previous_row = triangle.last
      new_row = [1] + pairings(previous_row).map(&:sum) + [1]
      triangle.push(new_row)
      rows
    end
  end

  private

  def pairings(arr)
    new_arr = []
    arr.each_with_index do |ele, idx|
      new_arr << [ele, arr[idx + 1]] if arr[idx + 1]
    end
    new_arr
  end
end

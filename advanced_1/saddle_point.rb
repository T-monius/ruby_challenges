# saddle_point.rb

class Matrix
  def initialize(matrix_representation)
    @matrix = create_matrix(matrix_representation)
  end

  def rows
    @matrix
  end

  def columns
    first_row = @matrix.first
    remaining_rows = @matrix[1..-1]
    first_row.zip(*remaining_rows)
  end

  def saddle_points
    coordinates = []
    @matrix.each_with_index do |row, row_idx|
      row.each_with_index do |element, col_idx|
        coordinates << [row_idx, col_idx] if great_in_row?(element, row) &&
                                             least_in_column?(element, col_idx)
      end
    end
    coordinates
  end

  private

  def create_matrix(matrix_representation)
    matrix_representation.split("\n").map do |row_representation|
      row_representation.split.map(&:to_i)
    end
  end

  def great_in_row?(element, row)
    row.all? { |other_element| element >= other_element }
  end

  def least_in_column?(element, col_idx)
    column = columns[col_idx]
    column.all? { |other_element| element <= other_element }
  end
end

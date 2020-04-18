## Saddle Point

### Understanding
- A saddle point is a number greater than or equal to all numbers in the same row; less than or equal to numbers of the same column
- x value is a row
- y value is a column
- `Matrix` class
  + `initialize`
    * takes a string
    * String represents a matrix
  + `#rows`
    * Getter
    * Returns rows at an index
  + `#saddle_points`
    * Returns an array of all saddle points
    * coordinates

### Task
- Write a program that detects saddle points in a matrix.

So say you have a matrix like so:

```
    0  1  2
  |---------
0 | 9  8  7
1 | 5  3  2     <--- saddle point at (1,0)
2 | 6  6  7
```

It has a saddle point at (1, 0).

It's called a "saddle point" because it is greater than or equal to every element in its row and less than or equal to every element in its column.

A matrix may have zero or more saddle points.

Your code should be able to provide the (possibly empty) list of all the saddle points for any given matrix.

Note that you may find other definitions of matrix saddle points online, but the tests for this exercise follow the above unambiguous definition.

### Implementation
- initial implementation of `#columns`

```ruby
    column_total = @matrix[0].length
    all_columns = []
    column_total.times do |i|
      current_column = []
      @matrix.each do |row|
        current_column << row[i]
      end
      all_columns << current_column
    end
    all_columns
```
- `#saddle_points`
  + Iterate each row
  + Iterate number in each row
    * See if num >= numbers in the row
    * See if num <= numbers in column
    * Store in return array if so
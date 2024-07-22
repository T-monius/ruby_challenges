# Series

## Problem

- A __series__ is a _consecutive sequence of digits_
- In order to identify a series of a give length `n` in a number
  the length `n` must be less than or equal to the given number's
  digit length.
- The number in the program will be represented by a string
  + This is a fundamental point because some of the strings
    have a leading zero which would not work for an integer
    representation of the number

__Understanding__:
- Input
  + The object capturing the input is a `Series` object
    > Passed to constructor method
    > String argument
    > Represents digits
  + `slices` instance method
    > Length `n`
    > Passed to the instance method as an argument
- Output
  + Substrings of n length
    > Represented in arrays
    > `slices` returns a multi-dimensional array with two
      layers
    > Inner arrays are all length `n`
    > Elements of inner arrays are integers
    > Inner arrays are individual digits of consecutive series
  + `slice` throws an argument error if the argument `n` is
    greater than the length of the series string.

## Examples/Test Cases

```ruby
idx = 4
next_idx = 5
series = Series.new('01234')
#                        c
#                         n
string_slices = ['01', '12', '23', '34']
#                 ^

series.slices(2)
#=> [0, 1], [1, 2], [2, 3], [3, 4]]
```

## Data Structures

- Arrays

## Algorithm

Create `Series` class
- `series` accessor
- `initialize` method
  - `str`? `series`? param
- `slices` instance method
  - `slice_len` `int` parameter
  - Operates on `series`
  - Get array of `string_slices`
  - Pass `string_slices` to `digit_slices` and return result
- `string_slices` private instance method 
  - Operates on `series`
- `digit_slices`
  - Takes an array of strings/sub-series
  - Returns nested arrays of digits

_slices method_
Instantiate a `string_slices` array (could reduce)
Iterate over input string w/ index
  Set `next_idx` (i.e`next_idx = current_idx + slice_length - 1`)
  Next unless `next_idx < input string length`
  Push a slice from`current_idx` to `next_idx` to `string_slices`
Transform `string_slices` to an array of integers
  Split string
    intermediate split state = ['1', '2']
    Transform split array by coercing each string to an int and returning at each iteration
Return transformed nested array of numbers

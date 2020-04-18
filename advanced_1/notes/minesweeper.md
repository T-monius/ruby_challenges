## Minesweeper

### Understanding
- Input
  + Array
  + String indexes
    * horizontal, vertical borders
    * empty spaces
    * asterisks (`*`)
- Output
  + Array
  + String values
    * ^ as above
    * Plus, numbers
      - Numbers represent adjacent asterisks
      - Integers
- Adjacent positions
  + Index  of same row +/- 1
    * Represented by a string
  + Row +/- 1
    * Same index
    * Index +/- 1
    * Represented by an array index
- Test Suite
  + `Board` class
    * `::transform`
      - Returns the board w/ counts
  + Errors
    * ALL `ValueError`s
    * Bad borders
    * Wrong lengths
    * Invalid characters


### Task
- Minesweeper is a popular game where the user has to find the mines using numeric hints that indicate how many mines are directly adjacent (horizontally, vertically, diagonally) to a square.

In this exercise you have to create some code that counts the number of mines adjacent to a square and transforms boards like this (where * indicates a mine):

```
+-----+
| * * |
|  *  |
|  *  |
|     |
+-----+
```

into this:

```
+-----+
|1*3*1|
|13*31|
| 2*2 |
| 111 |
+-----+
```

### Implementation
- Transform/map the array
  + ... from index 1 to -2
  + Transform/map the string at given index
    * If `' '`
    * 8 positions to check
    * Count += 1 if any of those positions is an `*`
      - Count same row
      - Count row above
      - Count row below
    * Empty space for a 0 (can perform a `gsub` if necessary)


##### test_transform1
```ruby
'+------+'
'| *  * |'
'|  *   |'
'|    * |'
'|   * *|'
'| *  * |'
'|      |'
'+------+'
```

#### test_faulty_border
```ruby
'+-----+'
'*   * |'
'+-- --+'
```
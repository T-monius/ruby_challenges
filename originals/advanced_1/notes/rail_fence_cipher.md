## Ruby Challenges: Rail Fence Cipher

### Understanding
- Rail Fence Cipher
  + Rails
  + Letters
  + Downwards then upwards
- Encode
  + Write out letters separated by a predetermined number of columns
  + Ratio betwen a row, gaps between letters, and leading gaps?
    * In example:
      - 25 total letters
      - 25 columns in a row
      - Row 1 has 3 empty slots and 0 empty at start
        + 18 total gaps (empty slots) in the row
        + 7 total letters
      - Row 2 has 1 empty slot and 1 empty slot at start
        + 13 total gaps (emplty slots) in the row
        + 12 total letters
      - Row 3 has 3 empty slots and 2 empty slots at start 
        + 19 total gaps (empty slots) in the row
        + 6 total letters
      - 25 / 7 = 3
        + 3 total rows
        + 3 spaces between letters in the first row (this is a coincidence)
          * 3 letters between the first letter and the second
          * Those leters are divided among two descending then ascending rows
  + First row
    * starts and ends with a letter (NOT RELEVANT)
    * Length equal to length of 'total letters'
    * Letters separated by columns (3)
  + Second row
    * Starts with an empty column
    * Then, next column is a letter followed by empty columns (1)
  + Third roe
    * Starts with empty columnd (2 in example)
    * Letters separared by columns in accord with number of empty columns at the start
  + Input
    * 2 arguments
    * 1 integer
    * Integer represents the number of rows
  + Output
    * A string the same length of the input string
    * Encoded according to the cipher 
- Questions about encoding
  + Is 7 a significant number?
    * Do you take the total number of letters and divide by 7 to determine the number of rows
    * Does 'Total Leters / 7' also give you the gaps in the first row
  + Can the number of rows be determined from the number of letters?
  + Can the empty slots per row be determined by the number of letters or rows?
  + Does this cipher only work for messages of 'certain' lengths
    * e.g. They all have to be multiples of 5 or something
- Decoding
  + First Row
    * 'letters' = 'total letters' / rows
  + Subsequent rows
    * Leading 'gaps' the 'index' of the row

#### Exercises / Test Cases
```ruby
# Input string is 9 characters
RailFenceCipher.encode('EXERCISES', 4)                # 'ESXIEECSR'

# Input string is 18 characters
RailFenceCipher.encode('XOXOXOXOXOXOXOXOXO', 2)       # 'XXXXXXXXXOOOOOOOOO'
```

```
E . . . . . S . .
. X . . . I . E .
. . E . C . . . S
. . . R . . . . .

X . X . X . X . X . X . X . X . X
. 0 . 0 . 0 . 0 . 0 . 0 . 0 . 0 .
```

### Implementation
- Data Structures
  + Array of strings
    * Inner arrays represent rows
    * Elements of the inner arrays represent columns
- Functional Abstraction
  + Odd Transformation
- Algorithm
  + Set an array to empty strings for the number of rows
  + Iterate for the length of the string
    * Inside the first iteration, iterate for each row in the array of strings
    * At each iteration, insert one letter
    * The x letter insertion is always 1 greater than the previous
    * The y for insertion increments and decrements
      - It increments from the start until the final y index
      - If y + 1 % 'total rows' equals 0, flip the decrement
      - If y index is 0 increment
- Hard Algorithm
  + Assign array variable to `rows` times `''`
  + Set a variable for `y_for_insertion` to `0`
  + Set variable `y_increment` to `true`
  + Iterate input string with index (`x`)
    * Iterate each element of array variable strings with index `y`
      - Push the letter at iteration if `y` equals `y` for insertion
      - Else, push ` . `
    * If `x + 1 % rows == 0` flip `y_increment`
    * Increment `y_for_insertion` if `y_increment` is `true`
    * Decrement `y_for_insertion` if `y_increment` is `false`

### Task
- Implement encoding and decoding for the rail fence cipher.

- The Rail Fence cipher is a form of transposition cipher that gets its name from the way in which it's encoded. It was already used by the ancient Greeks.

- In the Rail Fence cipher, the message is written downwards on successive "rails" of an imaginary fence, then moving up when we get to the bottom (like a zig-zag). Finally the message is then read off in rows.

- For example, using three "rails" and the message "WE ARE DISCOVERED FLEE AT ONCE", the cipherer writes out:
```
W . . . E . . . C . . . R . . . L . . . T . . . E
. E . R . D . S . O . E . E . F . E . A . O . C .
. . A . . . I . . . V . . . D . . . E . . . N . .
```
Then reads off:
```
WECRLTEERDSOEEFEAOCAIVDEN
```
To decrypt a message you take the zig-zag shape and fill the ciphertext along the rows.
```
? . . . ? . . . ? . . . ? . . . ? . . . ? . . . ?
. ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? .
. . ? . . . ? . . . ? . . . ? . . . ? . . . ? . .
```
The first row has seven spots that can be filled with `"WECRLTE"`.
```
W . . . E . . . C . . . R . . . L . . . T . . . E
. ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? . ? .
. . ? . . . ? . . . ? . . . ? . . . ? . . . ? . .
```
Now the 2nd row takes "ERDSOEEFEAOC".
```
W . . . E . . . C . . . R . . . L . . . T . . . E
. E . R . D . S . O . E . E . F . E . A . O . C .
. . ? . . . ? . . . ? . . . ? . . . ? . . . ? . .
```
Leaving "AIVDEN" for the last row.
```
W . . . E . . . C . . . R . . . L . . . T . . . E
. E . R . D . S . O . E . E . F . E . A . O . C .
. . A . . . I . . . V . . . D . . . E . . . N . .
```
If you now read along the zig-zag shape you can read the original message.
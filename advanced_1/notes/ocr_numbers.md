## OCR Numbers

### Understanding
- Input
  + Number
  + 3 x 4 grid
    * Lateral elements of a number
    * Vertical elements of a number
    * Pipes, underscores, spaces
    * Pipes
      > Vertical
        - 2nd and/or 3rd position
      > Lateral
        - 1st and/or 3rd position
    * Underscores
      > Vertical
        - 1st, 2nd, or 3rd
      > Lateral
        - 2nd
    * Spaces
      > Vertical
        - Anywhere
      > Lateral
        - Anywhere
      > Fourth row is always blank (spaces)
    * Newlines (`"/n"`)
      > Each digit is a series of 3 newline characters
        + Nothing follows the last newline character
        + A regex could parse an input string for series of 3 newlines
      > If a line doesn't contain a character, it is simply a newline
      > A final character in a line is followed immediately by a newline
        - There is no space to serve as a placeholder
  + Input size
    * There is no standard size of string for a number
    * Return a ? for an appopriate size input that doesn't match a number
  + Test suite doesn't test for errors
    * Build to pass the test
    * Add some error cases to test?
    * Build code to through errors with wrong inputs either way

### Task
- Determine which number(s) is/are represented
- Determine if a number is garbled

#### Step One
- Binary font
  + O or 1
  + Correct size
    * Return `?` if the input is not recognizable
  + Incorrect size
    * Return an error

#### Step Two
- Multi-character binary strings
- Garbled number replaced with a `?`

#### Step Three
- Recognize all numbers from 0 to 9
  + Individually
  + Part of a larger string

#### Step Four
- Multiple numbers
  + One per line
- Output
  + Several lines joined with a comma

#### Clases
- `OCR` class
  + An object of this class can be a single digit or multiple
    * 
  + `::new`
    * Takes a string
  + `#convert`
    * Returns a string
    * Numbers 0-9 and commas
    * Parse out the indivivual digits by newlines
    * The number of digits is reflected by the length between newlines
    * Length between newlines float divided by 3 and rounded up may be the number of digits
    * Each digit is represented by a range of indexes in each line?
    * Characters between newlines represent rows
      - Each digit will have its corresponding characers for that row represented in 3 strings
      - The strings can be parsed for each individual digit
      - A digit can have up to three characters represented in each row
        + The last digit in a given row can be less than three characters
        + Digits preceding the last digit will have a length of three
        + The last digit can be three charecters long **or** less

### Implementation
- Create an `OCRDigit` class?
  + Constructor takes three string arguments
    * Each string represent a line of digits
  <!-- + Define acceptable sizes -->
    * Should each digit be it's own class?
    * Start w/ '0' and '1'
    <!-- * Store the approved sizes in a constant as a collection -->
    <!-- * Each approved size has a set corresponding letters -->
      - Define methods to verify if string represents a given letter
      - The methods determine if characters are at certain indexes of the string

- `OCR` class

  + `::new`
    * Defines a series of `OCRDigits`
    * Parse the input by newlines
    * Iterate the input by each consecutive 3 characters (this should pass an empty string or less than three digits for a last digit)
    * Pass each set of elements for that row to an `OCRDigit` object
  + `convert`
    * Iterate the `OCR` digits
    * Return their integer representation
    * Join them into one sring (with commas if necessary)

#### Step 1
  + Build a regex to parse by newlines
    * `OCR` class
    * The initial match will be independent of size
  + Build another regex
    * `OCRDigit`
    * Checks size
    * Here is where an error could be thrown
  + Hash with string for `0` and `1` as the key
    + The given integers are the values
  + Array of acceptable sizes
    + Sizes of strings that can form digits
    + The array can be updated as digits are added

#### Step 3
  + Parse the string for newlines
    * First group is top half
    * Second is middle
    * Third is bottom (should be all blank)
  + Take each set of "newline splits"
    * Split these sections by consecutive three characters
    * Combine each associated section for an index (top, middle, bottom) by a newline
    * Store them in an array

#### Step 4
  + Parse the input by three newline characters
  + Each set of three newlines is a line of new digits
    * Iterate the lines
    * Get an array of digits digits for each line
    * Store in `ocr_digitst`
  + Change the `conver` method
    * Perform one join if no inner arrays
    * Perform two joins if inner arrays

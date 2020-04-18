## Diamond

### Understanding

#### Input
- Letter

#### Task
- Push rows in sequence from 'A' to input letter to a return string

#### Output
- A String which printed is the shape of a diamond with a letter as a buffer on either end of a number of spaces
- The letter 'A' is the only letter with spaces on either side of it
  + Spaces on either side of 'a' equal the ASCII value of input letter minus 'A'

### Implementation
- Instantiate a return string
- Set letter at iteration to 'A'
- Set the number of outer spaces from 'A' to the input letter minus 'A' on ASCII chart
- Set inner spaces to 0
- Set flag to `true`
- Iterate
  + Push outer spaces
  + Push letter at iteration
  + Push inner spaces
  + Push letter unless it's 'A'
  + Push outer spaces
  + Push '\n'
  + Return the new string if the input letter is 'A'
  + Return the new string if current letter is 'A' and return string alpha count is greater then 1 and the input letter is not 'A'
  + If the current letter equals the input letter then flip the flag
  + If flag is true
    * Letter at iteration `next`
    * Increment inner spaces
    * Decrement outer spaces
  + Else
    * Letter at iteration `ord` minus `1` then `chr`
    * Decrement inner spaces
    * Increment outer spaces

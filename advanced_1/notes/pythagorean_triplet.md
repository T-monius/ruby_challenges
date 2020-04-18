## Pythagorean Triplet

### Understanding
- To solve for `b` if `a` and `c` are known, subtract the result of `a**2` from `c**2`, and take the square root of the result.
- I'm assuming that the three variables are always consecutive
  + The examples are that way so far
  + Non-consecutive variables would vastly change the implementation
  + **Variables are non-consecutive**
- `::where`
  + Want all sets of 3 consecutive numbers where the set is a pythagorean
  + ^ is no longer true
  + Must come up with a way of getting all combinations of variables from the minimum factor to the max factor

### Task
- A Pythagorean triplet is a set of three natural numbers, `{a, b, c}`, for which, `a**2 + b**2 = c**2`.

For example, `3**2 + 4**2 = 9 + 16 = 25 = 5**2`.

#### There are no explicit tasks in the challenge
- Match the test suite:
  + `TripletTest` inherits from the not priorly seen `MiniTest::Unit::TestCase`
    * 
  + There is a class `Triplet`

##### Class Methods
  + `where`: takes keyword arguments
    * Returns an array
    * `max_factor`: determines the highest number to use when determining triplets in a range
    * `min_factor`: the lowest natural number to use when determining triplets in a range

##### Instance Methods
  + `sum` : sums `a`, `b`, `c`
  + `product`: the product of `a`, `b`, `c`
  + `pythagorean`: returns a boolean
    * Is `a` squared plus `b` squared = `c` squared

### Implementation
- `::where`
  + Define a range based on the arguments
  + Default for `min_factor` is `0`
  + Iterate
    * Create a new triplet object for a slice of three elements from the range
    * Store as a result if `#pythagorean` (`Range#select`?)
      - `#each_cons`  and `with_obj([])`

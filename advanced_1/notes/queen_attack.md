## Queen Attack

### Understanding
- In the example, if you subtract the x and y values of the White queen from the Black, you get two values which equal one another (i.e (3,3))
  + Is this true because you must find the difference in coordinates from the queen that is farther on the x-axis or y-axis?
  + Another example would be if the black queen were on (5, 0)
  + The absolute value of the black queen's x value minus white queen's x value must be equal to the absolute value of the black's y value minus white's y value (or vice versa)

- Test Suite
  + `Queens::new` class
    * Instantiates queens at default coordinates if not initialized with specific coordinates
    * Can take coordinates with keyword arguments
    * Error for inputting identical coordinates
  + Getter methods for `white` and `black` return coordinates
  + `Queens::to_s`
    * Returns a string representation of the board
  + `Queens#attack?`
    * boolean

### Task
- In the game of chess, a queen can attack pieces which are on the same row, column, or diagonal.

A chessboard can be represented by an 8 by 8 array.

So if you're told the white queen is at (2, 3) and the black queen at (5, 6), then you'd know you've got a set-up like so:

```
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ W _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ B _
_ _ _ _ _ _ _ _
_ _ _ _ _ _ _ _
```

You'd also be able to answer whether the queens can attack each other. In this case, that answer would be yes, they can, because both pieces share a diagonal.

### Implementation

#### Tackle the coordinates and attack questions first
- 

#### Drawing the board
-`Queens::new`
  + Draw the board at instantiation?
- `Queens#to_s`
  + Iterte arrays and draw the board?

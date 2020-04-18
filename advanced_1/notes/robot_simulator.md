## Robot Simulator

### Understanding
- Robots have movements
  + Robot class?
    * Robot has coordinates
    * Robot has bearing
    * Maintains knowedge of position on the grid
  + Turns change direction (`R` and `L`)
    * Can track direction with `Array#rotate`?
    * `['N', 'E', 'S', 'W']`
    * Rotate one direction (`.rotate`) for a right turn
  + Rotate the other direction (`.rotate(-1)`) for a left turn
  + `A` performs addition or subtraction
    * When facing west, - x
    * Facing east, + x
    * Facing north, + y
    * Facing south, - y
  + When an instruction is received:
    1. Determine the current direction
    2. Determine operation
      * Turn robot (change direction data structure)
      * Move robot (change position data structure)
    3. Perform operation
- Grid
  + Grid class?
  + 2 values
    * x, y axis/veritcal, horizontal
    * Verify position (method?)
  + Direction it's facing
    * Best tracked by the grid?
    * Final position (and that at every step) impacted by the starting position

#### Test Suite
##### RobotTurningTest
  + `Robot` class
    * `Robot#orient`
      - Setter for `bearing`
      - Takes a symbol
      - One of four cardinal directions
      - Changes the robot's position/bearing
      - Error for invalid bearing
    * `Robot#bearing`
      - Returns direction
      - symbol
    * `Robot#turn_right`
      - Changes the robots bearing
      - Based on current bearing/position
    * `Robot#turn_left`
      - Turns the other direction of `.turn_right`
    * `Robot#at`
      - Setter for `coordinates`
    * `Robot#coordinates`
      - Getter
      - x, y
    * `Robot#advance`
      - Move robot on grid
      - Add or subtract from coordinates
      - x or y

##### RobotSimulatorTest
  + `Simulator` class
    * `Simulator#instructions`
      - Proceses 1 or more capital letter instructions
      - Iterates the list of instructions
      - Returns the equivalent robot command in an array of symbols
    * `Simulator#place`
      - Sets both robots `coordinates` and `bearing`
    * `Simulator#evaluate`
      - Gives a robot a set of instructions

### Task
- A robot factory's test facility needs a program to verify robot movements.

- The robots have three possible movements:

1. turn right
2. turn left
3. advance

- Robots are placed on a hypothetical infinite grid, facing a particular direction (north, east, south, or west) at a set of {x,y} coordinates, e.g., {3,8}, with coordinates increasing to the north and east.

- The robot then receives a number of instructions, at which point the testing facility verifies the robot's new position, and in which direction it is pointing.

- The letter-string "RAALAL" means:
  + Turn right
  + Advance twice
  + Turn left
  + Advance once
  + Turn left yet again

- Say a robot starts at {7, 3} facing north. Then running this stream of instructions should leave it at {9, 4} facing west.

### Implementation
- `coordinates` instance variable
- `bearing` instance variable
- Instantiating a new robot sets instance variables
  + default coordinates [0,0]?

## Bowling

### Understanding
- Game
- Ball
  + Throw
    * 0-10
- Pin
  + Down
- Score
- Frame
  + Frame: 1 or 2 ball throws
  + 10 frames
  + 10 pins to start
  + Cases
    1. 'Open frame', score of less than 10 recorded.
    2. 'Spare', 10 pins down.
      * After 2nd throw
      * 10 plus pins down in next throw
    3. 'Strike', 10 pins down.
      * First throw
      * 10 plus next two throws
  + 10th Frame
    + Special case 1, 2, or 3 balls
    + Fill ball
      * For strikes or spares
      * Potential third throw

### Task
- Write a program that can score a bowling game.

- Bowling is game where players roll a heavy ball to knock down pins arranged in a triangle. Write code to keep track of the score of a game of bowling.

#### Scoring Bowling

- The game consists of 10 frames. A frame is composed of one or two ball throws with 10 pins standing at frame initialization. There are three cases for the tabulation of a frame.

- An open frame is where a score of less than 10 is recorded for the frame. In this case the score for the frame is the number of pins knocked down.

- A spare is where all ten pins are knocked down after the second throw. The total value of a spare is 10 plus the number of pins knocked down in their next throw.

- A strike is where all ten pins are knocked down after the first throw. The total value of a strike is 10 plus the number of pins knocked down in their next two throws. If a strike is immediately followed by a second strike, then we can not total the value of first strike until they throw the ball one more time.

- Here is a three frame example:

Frame 1    |  Frame 2    |  Frame 3
X (strike) |  5/ (spare) |  9 0 (open frame)

Frame 1 is (10 + 5 + 5) = 20

Frame 2 is (5 + 5 + 9) = 19

Frame 3 is (9 + 0) = 9

This means the current running total is 48.

- The tenth frame in the game is a special case. If someone throws a strike or a spare then they get a fill ball. Fill balls exist to calculate the total of the 10th frame. Scoring a strike or spare on the fill ball does not give the player more fill balls. The total value of the 10th frame is the total number of pins knocked down.

- For a tenth frame of X1/ (strike and a spare), the total value is 20.

- For a tenth frame of XXX (three strikes), the total value is 30.

#### Requirements

- Write code to keep track of the score of a game of bowling. It should support two operations:

- roll(pins) is called each time the player rolls a ball. The argument is the number of pins knocked down.

- score() is called only at the very end of the game. It returns the total score for that game.

### Implementation
- Game
  + Ten frames
  + Data Structure that holds frames
  + Frames are numbered in sequence, so indexes are helpful
  + Array w/ ten frames (inner arrays)
  + `#score`
    * Iterte all frames
      - If a frame at iteration is a strike
        + Add next frame [0]
        + Add next frame [1]
          * If next frame [1] nil
          * Add two frames from frame [0]
      - If frame at iteration is a spare
        + Add next frame [0]
      - Else
        + frame_total

- Throw / roll
  + `#roll`
    * Takes an integer representing the result of throwing/rolling a ball
    1. Throw an error if 10 frames have already been played && not filling
    2. Throw an error if the the pin rolled would be a mismatch for the frame
    3. Add a new frame if necessary
    4. Add the roll to the current frame

- Frame
  + `#add_new_frame`
  + `play_current_frame?`
  + Data Structure that can hold 2 or three throws/rolls (probably always 2)
    * Array
    * Ex, `[1, 2]`
  + Fill ball
    * Separate variable?
  + Pins
    * Pins are part of the frame
    * `#pin_mismatch?`
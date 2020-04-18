# robot_simulator.rb

class Robot
  attr_reader :coordinates

  def initialize
    @orientation = [:north, :east, :south, :west]
    at(0, 0)
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def orient(new_bearing)
    raise ArgumentError if !orientation.include?(new_bearing)
    while orientation[0] != new_bearing
      orientation.rotate!
    end
  end

  def bearing
    orientation[0]
  end

  def turn_right
    orientation.rotate!
  end

  def turn_left
    orientation.rotate!(-1)
  end

  def advance
    case orientation[0]
    when :north
      coordinates[1] = coordinates[1] + 1
    when :east
      coordinates[0] = coordinates[0] + 1
    when :south
      coordinates[1] = coordinates[1] - 1
    when :west
      coordinates[0] = coordinates[0] - 1
    end
  end

  private
  attr_reader :orientation

end

class Simulator
  COMMANDS = { 'A' => :advance, 'L' => :turn_left, 'R' => :turn_right}

  def initialize; end

  def instructions(str)
    str.chars.map { |command| COMMANDS[command] }
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, str)
    commands = instructions(str)
    commands.each { |command| robot.send(command) }
  end
end

# robot_name.rb

class Robot
  attr_accessor :name
  @historic_names = []

  def initialize
    self.name = produce_valid_name
  end

  def reset
    self.name = produce_valid_name
  end

  def self.historic_names
    @historic_names
  end

  private

  def random_name
    caps = ('A'..'Z').to_a
    name_string = ''
    2.times { name_string << caps.sample }
    3.times { name_string << rand(10).to_s }
    name_string
  end

  def valid_name
    potential_name = random_name
    until valid?(potential_name)
      potential_name = random_name
    end
    potential_name
  end

  def valid?(name)
    !Robot.historic_names.include?(name)
  end

  def produce_valid_name
    new_name = valid_name
    Robot.historic_names << new_name
    new_name
  end
end

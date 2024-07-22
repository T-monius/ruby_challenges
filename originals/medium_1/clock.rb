# clock.rb

class Clock
  include Comparable

  def initialize(hrs=0, mins=0)
    self.hours = hrs % 24
    self.minutes = mins
  end

  def self.at(hrs=0, mins=0)
    Clock.new(hrs, mins)
  end

  def to_s
    "%02d:%02d" % [hours, minutes]
  end

  def +(int)
    hrs, mins = (total_minutes + int).divmod(60)
    Clock.new(hrs, mins)
  end
  
  def -(int)
    hrs, mins = (total_minutes - int).divmod(60)
    Clock.new(hrs, mins)
  end

  protected

  attr_accessor :hours, :minutes

  def total_minutes
    hours * 60 + minutes
  end

  def <=>(other_clock)
    total_minutes <=> other_clock.total_minutes
  end
end

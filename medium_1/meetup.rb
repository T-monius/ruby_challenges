# meetup.rb

require 'date'

class Meetup
  WEEKDAYS = { monday: 1, tuesday: 2, wednesday: 3, thursday: 4,
               friday: 5, saturday: 6, sunday: 7 }
  TOTALDAYS = { 1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31,
                6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31,
                11 => 30, 12 => 31 }
  WEEKS = { first: (1..7), second: (8..14), third: (15..21),
            teenth: (13..19), fourth: (22..28) }

  attr_accessor :month, :yr, :day_month_starts

  def initialize(month, yr)
    self.month = month
    self.yr = yr
    self.day_month_starts = Date.new(yr, month, 1).cwday
  end

  def day(weekday, schedule)
    day_of_month = 1
    wkday = day_month_starts
    desired_weekday = WEEKDAYS[weekday]
    loop do
      break if wkday == desired_weekday &&
               right_week?(day_of_month, schedule)
      day_of_month += 1
      (wkday + 1) > 7 ? wkday = 1 : wkday += 1
    end
    Date.new(yr, month, day_of_month)
  end

  private

  def right_week?(day, wk)
    if WEEKS[wk]
      true if WEEKS[wk].cover?(day)
    elsif last_week?(day)
      true
    end
  end

  def last_week?(day)
    return true if (day + 7) > TOTALDAYS[month]
    false
  end
end

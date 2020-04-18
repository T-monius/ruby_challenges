# grade_school.rb

class School
  def initialize
    self.roster = []
  end

  def add(student, grade)
    roster << [student, grade]
  end

  def grade(yr)
    roster.select { |_, grade| grade == yr }
          .map { |(student, _)| student }
          .sort
  end

  def to_h
    return {} if roster.empty?
    roster_hsh = Hash.new([])
    roster.each do |student, grade|
      roster_hsh[grade] += [student]
    end
    roster_hsh.each { |_, students| students.sort! }
    roster_hsh.sort.to_h
  end

  private

  attr_accessor :roster
end

# point_mutations.rb

# The class stores a string representation of a DNA strand.
# The strand can be compared to another for its 'Hamming
# Distance' with an instance method by the same name that
# returns and integer.
class DNA
  def initialize(strand)
    self.strand = strand
  end

  def hamming_distance(comparative_strand)
    if strand.length <= comparative_strand.length
      compare_strands(strand, comparative_strand)
    else
      compare_strands(strand[0..comparative_strand.length - 1],
                      comparative_strand)
    end
  end

  private

  attr_accessor :strand

  def compare_strands(strand, strand1)
    count = 0
    strand.each_char.with_index do |char, idx|
      count += 1 if char != strand1[idx]
    end
    count
  end
end

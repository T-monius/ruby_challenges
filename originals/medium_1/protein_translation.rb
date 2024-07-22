# protein_translation.rb

class InvalidCodonError < StandardError; end

class Translation
  AMINO_ACIDS = { 'AUG' => 'Methionine', 'UUU' => 'Phenylalanine',
                  'UUC' => 'Phenylalanine', 'UUA' => 'Leucine',
                  'UUG' => 'Leucine', 'UCU' => 'Serine',
                  'UCC' => 'Serine', 'UCA' => 'Serine',
                  'UCG' => 'Serine', 'UAU' => 'Tyrosine',
                  'UAC' => 'Tyrosine', 'UGU' => 'Cysteine',
                  'UGC' => 'Cysteine', 'UGG' => 'Tryptophan',
                  'UAA' => 'STOP', 'UAG' => 'STOP', 'UGA' => 'STOP' }
  def self.of_codon(three_nucleotides)
    AMINO_ACIDS[three_nucleotides]
  end

  def self.of_rna(strand)
    raise InvalidCodonError if strand.match?(/[^UAGC]/)
    codons = strand.scan(/\w\w\w/)
    valid_codons = codons.take_while do |nucleotides|
      of_codon(nucleotides) != 'STOP'
    end
    valid_codons.map { |three_nucleotides| of_codon(three_nucleotides) }
  end
end

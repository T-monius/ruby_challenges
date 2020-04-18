# protein_translation_notes.rb

# Understanding:
# - RNA sequences
#   + Always 9 characters?
#   + 3 nucleotide sequences
#     > Codons
#     > 3 characters
#     > STOP codons
#       = Subsequent ignored
#   + Polypeptide/amino acid
#     > Correspond to codon
# - Codon -> Amino acid key for exercise given
# - Class method `Translation::of_codon`
#   + Input
#     - String representing a codon
#   + Output
#     - String, Amino acid
# - Class method `Translation::of_rna`
#   + Input
#     > String, rna strand
#     > Raise error if invalid strand
#       = `InvalidCodeError`
#   + Output
#     > Array of strings
#     > Amino acids

# Approach:
#   - `Translation::of_codon`
#     + Dictionary lookup
#   - `Translation::of_rna`
#     + Return if invalid character (Regex)
#     + Parse string into three characters (Regex)
#       > Scan
#     + Map calling `Translation::of_codon`

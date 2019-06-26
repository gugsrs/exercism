//Solution goes in Sources
let NUCLEOTIDES = ["A", "C", "G", "T"]

struct DNA {
	strand: String

	init(strand: String) {
		self.strand = strand
		strand.forEach{ char in
			if !NUCLEOTIDES.contains(char) {
				return nil
			}
		}
	}
}

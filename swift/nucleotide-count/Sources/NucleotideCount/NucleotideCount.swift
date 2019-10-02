//Solution goes in Sources
let NUCLEOTIDES = ["A", "C", "G", "T"]

struct DNA {
	var strand: String

	init?(strand: String) {
		self.strand = strand
		for char in strand {
			if !NUCLEOTIDES.contains(String(char)) {
				return nil
			}
		}
	}

	func count(_ char: Character) -> Int {
		return self.strand.filter { $0 == char }.count
	}

	func counts() -> [String: Int] {
		var counter: [String : Int] = [:]
		for nucleotide in NUCLEOTIDES {
			counter[nucleotide] = count(Character(nucleotide))
		}
		return counter
	}
}

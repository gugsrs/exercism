def distance(strand_a, strand_b):
    if len(strand_a) != len(strand_b):
        raise ValueError("Strands must have same length.")

    hamming = [1 for a, b in zip(strand_a, strand_b) if a != b]
    return len(hamming)

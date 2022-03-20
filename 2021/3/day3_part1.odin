package main

import "core:os"
import "core:fmt"
import "core:strings"

main ::proc() {
	input_data, file_ok := os.read_entire_file("input.txt")
	if !file_ok {
		fmt.eprintf("Failed to read input data")
		os.exit(1)
	}
	values   := strings.split(string(input_data), "\n")
	num_bits := len(values[0])
	bits_set := make([]int, num_bits)
	
	for number in values {
		for i, bit in number {
			bits_set[bit] += i == '1' ? 1 : 0
		}
	}
	
	gamma, epsilon: int
	for i, value in bits_set {
		if i >= len(values) - i {
			gamma |= (1 << uint(num_bits - value - 1))
		} else {
			epsilon |= (1 << uint(num_bits - value - 1))
		}
	}
	fmt.println(gamma)
	fmt.println(epsilon)
}

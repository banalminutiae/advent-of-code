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
}

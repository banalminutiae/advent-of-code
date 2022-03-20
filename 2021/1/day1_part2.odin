package main

import "core:os"
import "core:fmt"
import "core:strings"
import "core:slice"
import "core:strconv"

main :: proc() {
	input_data, file_ok := os.read_entire_file("input.txt")
	if !file_ok {
		fmt.eprintf("Failed to read input data")
		os.exit(1)
	}
	check_increase(input_data)
}

check_increase :: proc(input_data: []u8) {
	increased := 0
	measurements := slice.mapper(strings.split(string(input_data), "\n"), strconv.atoi)

	for i := 3; i < len(measurements); i+=1 {
		// since subsequent windows share two values out of three, simply compare the
		// value that changes i.e. the third value in the window
		if measurements[i] > measurements[i-3] do increased += 1
	}
	fmt.println(increased)
}

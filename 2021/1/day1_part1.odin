package main

import "core:os"
import "core:fmt"
import "core:slice"
import "core:strings"
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
	increased	:= 0
	measurements := slice.mapper(strings.split(string(input_data), "\n"), strconv.atoi)
	current_value := measurements[0]
	
	for depth in measurements[1:] {
		if depth > current_value {
			increased += 1
		}
		current_value = depth
	}
	fmt.println(increased)
}

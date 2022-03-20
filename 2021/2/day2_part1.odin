package main

import "core:os"
import "core:slice"
import "core:fmt"
import "core:strings"
import "core:strconv"

main ::proc() {
	input_data, file_ok := os.read_entire_file("input.txt")
	if !file_ok {
		fmt.eprintf("Failed to read input data")
		os.exit(1)
	}

	position, depth : int
	command_string := string(input_data)
	for line in strings.split(command_string, "\n") {
		command := strings.split(line, " ")
		fmt.println(command)
		amount  := strconv.atoi(command[1])
		switch command[0] {
			case "up":
				depth -= amount
			case "forward":
				position += amount
			case "down":
				depth += amount
		}
	}
	fmt.println(position*depth)
}

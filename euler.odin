package main

import "core:fmt"
import "core:os"
import "core:strconv"
import "core:strings"
import "problems"


main :: proc() {
    max_index := len(problems.registry) - 1
    fmt.printf("Select problem to run (0-%d) [Default: %d]: ", max_index, max_index)
//     read input from stdin
    buf: [128]byte
    n, err := os.read(os.stdin, buf[:])
    if err != nil {
        fmt.println("Error reading input.")
        return
    }
    input_str := strings.trim_space(string(buf[:n]))
//     default to last problem
    choice := max_index
    
    if input_str != "" {
        if val, ok := strconv.parse_int(input_str); ok {
            if val >= 0 && val <= max_index {
                choice = val
            } else {
                fmt.printf("Value out of range. Running default problem: %d\n", max_index)
            }
        } else {
            fmt.printf("Value out of range. Running default problem: %d\n", max_index)
        }
    }
    selected_problem := problems.registry[choice]
    result := selected_problem()
    fmt.printf("Problem solution calculated as:\n")
    fmt.println(result)
}

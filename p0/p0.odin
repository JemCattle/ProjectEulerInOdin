package main

import "core:fmt"

main :: proc() {
    odd_square_sum := 0
    for i := 1; i < 168_000; i += 2 {
        sq := i * i
        if !(sq %% 2 == 0) {
            odd_square_sum += sq
        }
    }
    fmt.println(odd_square_sum)
}

package problems

import "core:fmt"
import "core:strconv"
import "core:strings"

Problems :: proc() -> int 

p0 :: proc() -> int {
    odd_square_sum := 0
    for i := 1; i < 168_000; i += 2 {
        sq := i * i
        if !(sq %% 2 == 0) {
            odd_square_sum += sq
        }
    }
    return odd_square_sum
}

p1 :: proc() -> int {
    cum := 0
    for i := 0; i < 1000; i += 1 {
        if i %% 3 == 0 || i %% 5 == 0 {
            cum += i
        }
    }
    return cum
}

p2 :: proc() -> int {
    cum := 0
    i, j := 1, 2
    for ; i < 4_000_000 ; {
        if i %% 2 == 0 {
            cum += i
        }
        i, j = j, i + j
    }
    return cum
}

p3 :: proc() -> int {
    target := 600_851_475_143
    largest_prime_factor : int
    smallest_factor : int
    for f := 2; f < (target / 2); f += 1 {
        if target %% f == 0 {
            fmt.printfln("%d is smallest factor", f)
            smallest_factor = f
            break
        }
    }
    
    largest_factor := target / smallest_factor
    for i := largest_factor; i >= smallest_factor; i -= 1 {
        if target %% i == 0 {
            fmt.printfln("%d is a factor", i)
            prime := true
            for j := 2; j <= (i / 2); j += 1 {
                if i %% j == 0 {
                    fmt.printfln("%d is not prime", i)
                    prime = false
                    break
                }
            }
            if prime {
                fmt.printfln("%d is prime", i)
                largest_prime_factor = i
                break
            }
        }
    }
    fmt.println("Largest prime factor is:")
    return largest_prime_factor
}

is_palindrome :: proc(n: int) -> bool {
    input_n := cast(i64)n
    buf : [6]byte
    str_n : string = strconv.write_int(buf[:], input_n, 10)
    rev_str_n := strings.reverse(str_n)
    rev_n, ok := strconv.parse_int(rev_str_n, 10)
    if n == rev_n {
        return true
    } else {
        return false
    }
}

p4 :: proc() -> int {
    largest : int
    for y:= 999 ; y > 99 ; y -= 1 {
        for x:= 999 ; x > 99 ; x -= 1 {
            fmt.printfln("x is %d, y is %d", x, y)
            xy, xx := x*y, x*x
            fmt.printfln("checking: %d, %d", xy, xx)
            if is_palindrome(xy) {
                if xy > largest {
                    largest = xy
                    fmt.printfln("Largest is %d", largest)
                }
            }
            if is_palindrome(xx) {
                if xx > largest {
                    largest = xx
                    fmt.printfln("Largest is %d", largest)
                }
            }
        }
    }
    return largest
}

p5 :: proc() -> int {
    smallest : int
    found := 0
    i := 2520
    for found < 1 {
        found = 1
        j := 1
        for ; j < 21 ; j += 1 {
            if i %% j != 0 {
                found = 0
                break
            }
        }
        if found == 1 {
            smallest = i
        } else {
            fmt.printfln("factors of %d failed on %d", i, j)
        }
        i += 20
    }
    return smallest
}

p6 :: proc() -> int {
    sum_of_sqr : int
    sqr_of_sum : int
    difference : int
    for i := 1; i < 101; i += 1 {
        sum_of_sqr += i * i
    }
    for i := 1; i < 101; i += 1 {
        sqr_of_sum += i
    }
    sqr_of_sum = sqr_of_sum * sqr_of_sum
    difference = sqr_of_sum - sum_of_sqr
    fmt.printfln("sum of the squares is %d, square of the sum is %d\ntherefore the diference is %d", sum_of_sqr, sqr_of_sum, difference)
    return difference
}

registry := []Problems{
    p0,
    p1,
    p2,
    p3,
    p4,
    p5,
    p6,
}

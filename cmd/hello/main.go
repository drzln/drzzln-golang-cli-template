package main

import (
    "fmt"
    "os"
    "go-hello/pkg/hellolib"
)

func main() {
    name := "World"
    if len(os.Args) > 1 {
        name = os.Args[1]
    }
    fmt.Println(hellolib.Greet(name))
}

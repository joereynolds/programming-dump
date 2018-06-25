package main

import (
    "net/http"
    "log"
    "io"
)

func helloWorld(w http.ResponseWriter, req *http.Request) {
    io.WriteString(w, "Hello, world!")
}

func main() {
    http.HandleFunc("/hello", helloWorld)
    log.Fatal(http.ListenAndServe(":8888", nil))
}

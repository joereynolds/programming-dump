package main    

import "os"
import "fmt"
import "io/ioutil"
import "strings"

func main() {
    startArg := os.Args[1]
    endArg := os.Args[2]

    if len(os.Args) < 3 { 
        fmt.Println("Please specify a start and end word for the ladder")
        os.Exit(0)
    }

    if len(startArg) != 4 || len(endArg) != 4 {
        fmt.Println("Start and end words need to be 4 letters long")
        os.Exit(0)
    }

    content, _ := ioutil.ReadFile("./selected_four-letter_words.txt")
    words := strings.Split(string(content), "\n")
    ladder := wordLadder(startArg, endArg, words)
    fmt.Println(strings.Join(ladder, "\n"))
}

func wordLadder(start string, end string, words []string) ([]string) {
    ladder := []string {start}

    if start == end {
        return ladder
    }

    endDiffCount := 3
    previousWord := start

    for _, outerWord := range words {
        for _, innerWord := range words {
            if letterDiffCount(innerWord, outerWord) == 1 &&
               letterDiffCount(previousWord, innerWord) == 1 && 
               letterDiffCount(innerWord, end) == endDiffCount &&
               !contains(ladder, innerWord) {
                    ladder = append(ladder, innerWord)
                    previousWord = innerWord
                    endDiffCount--
                }
            }
        }
    return ladder
}

func contains(array []string, word string) (bool) {
    for _, item := range array {
        if item == word {
            return true
        }
    }
    return false
}

// Brings back the count of all letters that are different between two words
func letterDiffCount(word string, otherWord string) (int) {
    count := 0;

    if len(word) == 4 && len(otherWord) == 4 {
        for i, _ := range word {
            if word[i] != otherWord[i] {
                count++
            }
        }
    }
    return count;
}

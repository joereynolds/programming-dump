package main    

import "os"
import "fmt"
import "io/ioutil"
import "strings"

func main() {
    word := os.Args[1]
    content, _ := ioutil.ReadFile("./selected_four-letter_words.txt")
    words := strings.Split(string(content), "\n")
    ladder := closeWords(word, words)
    fmt.Println(strings.Join(ladder, "\n"))
}

func closeWords(word string, words []string) ([]string) {
    var ladder []string

    for _, currentWord := range words {
        if letterDiffCount(word, currentWord) == 1 {
            ladder = append(ladder, currentWord)
        }
    }
    return ladder
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

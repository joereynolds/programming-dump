package main    

import "os"
import "fmt"
import "io/ioutil"
import "strings"
import "testing"
import "reflect"

func main() {
    testWordLadder()

    if len(os.Args) < 3 { 
        fmt.Println("Please specify a start and end word for the ladder")
        os.Exit(0)
    }

    startArg := os.Args[1]
    endArg := os.Args[2]

    if len(startArg) != 4 || len(endArg) != 4 {
        fmt.Println("Start and end words need to be 4 letters long")
        os.Exit(0)
    }

    content, _ := ioutil.ReadFile("./selected_four-letter_words.txt")

    words := strings.Split(string(content), "\n")
    ladder := wordLadder(startArg, endArg, words)
    fmt.Println(strings.Join(ladder, "\n"))
}

func wordLadder(start string, end string, words []string) ([]string){
    ladder := []string {start}

    if start == end {
        return ladder
    }

    startDiffCount := 0
    endDiffCount := 4 // Length of the word

    for _, word := range words {
        if letterDiffCount(word, start) == startDiffCount + 1 && letterDiffCount(word, end) == endDiffCount - 1 {
            ladder = append(ladder, word)
            startDiffCount++
            endDiffCount--
            continue
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

func testWordLadder(t *testing.T) {
    content, _ := ioutil.ReadFile("./selected_four-letter_words.txt")
    words := strings.Split(string(content), "\n")

    ladder := wordLadder("cold", "warm", words)

    l := []string {"l"}
    if !reflect.DeepEqual(ladder, l) {
        t.Errorf("something")
    }
}

package main

import "testing"
import "reflect"
import "io/ioutil"
import "strings"

func TestWordLadder(t *testing.T) {
    content, _ := ioutil.ReadFile("./selected_four-letter_words.txt")
    words := strings.Split(string(content), "\n")

    tables := []struct {
        actual []string
        expected []string
    } {
        {
            wordLadder("cold", "toad", words),
            []string{"cold", "cola", "tola", "told", "toad"},
        }, {
            wordLadder("cold", "warm", words),
            []string{"cold", "wold", "word", "worm", "warm"},
        }, {
            wordLadder("heat", "boat", words),
            []string{"heat", "head", "bead", "beat", "boat"},
        },
    }

    for _, table := range tables {
        if !reflect.DeepEqual(table.actual, table.expected) {
            t.Errorf("Actual not equal to expected")
        }
    }
}


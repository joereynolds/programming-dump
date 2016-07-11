(use test)
(load "bob.scm")


(test "responds-to-something"
            "Whatever."
            (response-for "To-may-to, tom-aaaah-to."))

(test "responds-to-shouts"
            "Whoa, chill out!"
            (response-for "WATCH OUT!"))

(test "responds-to-questions"
            "Sure."
            (response-for "Does this cryogenic chamber make me look fat?"))

(test "responds-to-forceful-talking"
            "Whatever."
            (response-for "Let's go make out behind the gym!"))

(test "responds-to-acronyms"
            "Whatever."
            (response-for "It's OK if you don't want to go to the DMV."))

(test "responds-to-forceful-questions"
            "Whoa, chill out!"
            (response-for "WHAT THE HELL WERE YOU THINKING?"))

(test "responds-to-shouting-with-special-characters"
            "Whoa, chill out!"
            (response-for "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"))

(test "responds to shouting numbers"
            "Whoa, chill out!"
            (response-for "1, 2 ,3, GO!"))

(test "responds-to-shouting-wit-no-exclamation-mark"
            "Whoa, chill out!"
            (response-for "I HATE YOU"))

(test "responds-to-statement-containing-question-mark"
            "Whatever."
            (response-for "Ending with ? means a question."))

(test "responds-to-silence"
            "Fine. Be that way!"
            (response-for ""))

(test "responds-to-prolonged-silence"
            "Fine. Be that way!"
            (response-for "     "))

(test "responds-to-only-numbers"
            "Whatever."
            (response-for "1, 2, 3"))

(test "responds-to-number-question"
            "Sure."
            (response-for "4?"))

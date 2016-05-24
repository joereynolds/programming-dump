;# Description
;Yesterday, Devon the developer made an awesome webform,
;which the sales team would use to record the results from today's big new marketing campaign,
;but now he realised he forgot to add a validator to the "delivery_date" field!
;He proceeds to open the generated spreadsheet but, as he expected,
;the dates are all but normalized... Some of them use `M D Y` and others `Y M D`,
;and even arbitrary separators are used! Can you help him parse all the messy text into
;properly ISO 8601 (`YYYY-MM-DD`) formatted dates before beer o'clock?
;
;Assume only dates starting with 4 digits use `Y M D`, and others use `M D Y`.
;
;# Sample Input
;    2/13/15
;    1-31-10
;    5 10 2015
;    2012 3 17
;    2001-01-01
;    2008/01/07
;
;# Sample Output
;    2015-02-13
;    2010-01-31
;    2015-05-10
;    2012-03-17
;    2001-01-01
;    2008-01-07
;
;# Notes and Further Reading
;- https://en.wikipedia.org/wiki/ISO_8601
;- http://php.net/manual/en/function.strtotime.php
;- https://xkcd.com/1179/
;- *Moderator note:* If you would like to solve the general case to absolutely work on all possible input dates, check out this video first: https://www.youtube.com/watch?v=-5wpm-gesOY

(use posix) ;contains date funtions
(use data-structures) ;useful string functions

(define parse-date
  (lambda (date-string)
       (string-split date-string " -/")))

(define date-mdy?
  (lambda (date-string)
    (display "stub")))

(define date-ymd?
  (lambda (date-string)
    (display "stub")))

(display (parse-date "2008/01/07"))
(display "\n")
(display (parse-date "2/13/15"))
(display "\n")
(display (parse-date "5 10 2015"))
(display "\n")
(display (parse-date "2008-01-01"))
(display "\n")

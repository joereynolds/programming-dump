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
;- *Moderator note:*
;If you would like to solve the general case to absolutely work on all
;possible input dates, check out this video first:
;https://www.youtube.com/watch?v=-5wpm-gesOY

;improvements:
;  - Use (format) to pad the zeroes out when necessary
;      http://wiki.call-cc.org/man/4/Unit%20extras#fprintf
(use posix) ;contains date functions
(use data-structures) ;string-split
(use extras) ;sprintf

; parse-date :: String -> [String]
(define parse-date
  (lambda (date-string)
    (string-split date-string " -/")))

; date-mdy :: String -> Bool
(define date-mdy?
  (lambda (date-string)
    (if (not (date-ymd? date-string))
      #t
      #f)))

; date-ymd :: String -> Bool
(define date-ymd?
  (lambda (date-string)
    (if
      (= (string-length (list-ref (parse-date date-string) 0)) 4)
      #t
      #f)))

; convert-date :: String -> String
(define convert-date
  (lambda (date-string)
    (if (date-ymd? date-string)
      (convert-date-from-ymd (parse-date date-string))
      (convert-date-from-mdy (parse-date date-string)))))


; convert-date-from-ymd :: [String] -> String
(define convert-date-from-ymd
  (lambda (parsed-date)
    (sprintf "~A-~A-~A"
      (list-ref parsed-date 0)
      (zero-pad (list-ref parsed-date 1))
      (list-ref parsed-date 2))))

; convert-date-from-mdy :: [String] -> String
(define convert-date-from-mdy
  (lambda (parsed-date)
    (sprintf "~A-~A-~A"
      (year-pad(list-ref parsed-date 2))
      (zero-pad(list-ref parsed-date 0))
      (zero-pad(list-ref parsed-date 1)))))

; zero-pad :: String -> String
(define zero-pad
  (lambda (n)
    (if
      (and (< (string->number n) 10) (= (string-length n) 1))
      (sprintf "0~A" n)
      n)))

; year-pad :: String -> String
(define year-pad
  (lambda (year)
    (if (= (string-length year) 2)
      (sprintf "20~A" year)
      year)))

;Sample inputs
(assert (string=?
          (convert-date "2/13/15")
          "2015-02-13"))

(assert (string=?
          (convert-date "1-31-10")
          "2010-01-31"))

(assert (string=?
          (convert-date "5 10 2015")
          "2015-05-10"))

(assert (string=?
          (convert-date "2012 3 17")
          "2012-03-17"))

(assert (string=?
          (convert-date "2001-01-01")
          "2001-01-01"))

(assert (string=?
          (convert-date "2008/01/07")
          "2008-01-07"))


;'Unit' tests...kinda
(assert (equal?
          (date-mdy? "2/14/16")
          #t))

(assert (string=?
          (zero-pad "4")
          "04"))

(assert (string=?
          (year-pad "10")
          "2010"))

(assert (equal?
          (date-ymd? "2003/02/03")
          #t))

(assert (equal?
          (parse-date "2008/01/07")
          '("2008" "01" "07")))

(assert (equal?
          (parse-date "2/13/15")
          '("2" "13" "15")))

(assert (equal?
          (parse-date "5 10 2015")
          '("5" "10" "2015")))

(assert (equal?
          (parse-date "2008-01-01")
          '("2008" "01" "01")))

(use test)
(use srfi-13)


(define extension
  (lambda (path)
    (cond
      ((string-null? path) "Please enter a filename")
      (else (string-index-right path #\.)))))


(test "It can handle empty strings" "Please enter a filename" (extension ""))
(test "It gets an extension for a normal file" ".gif" (extension "cat.gif"))
(test "It only gets the last extension" "php" (extension "myfile.backup.php"))

(use test)
(load "hello-world.scm")

(test "Called with no args returns hello world" "Hello, World!" (hello))
(test "Called with an arg returns hello arg" "Hello, exercism!" (hello "exercism"))

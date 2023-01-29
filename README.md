# truth-table

A library that prints a truth-table of a boolean function.

# INstallation

Clone the repository on your `quicklisp/local-projects` directory and then load with

 `(ql:quickload :truth-table)`

# Usage

`(truth-table:print-truth-table #'boolean-function "function-name" number-of-arguments)`

# Example

```lisp
(ql:quickload :truth-table)

(defun mux (a b c)
  (if (= c 0)
     a
     b))
     
(truth-table:print-truth-table #'mux "mux" 3)

;; This code prints

;; --------------------------------
;; Function name: mux
;; --------------------------------
;; (0 0 0) -> NIL
;; (0 0 1) -> NIL
;; (0 1 0) -> NIL
;; (0 1 1) -> T
;; (1 0 0) -> T
;; (1 0 1) -> NIL
;; (1 1 0) -> T
;; (1 1 1) -> T

```
(defpackage :truth-table
  (:use :cl)
  (:export print-truth-table))


(in-package :truth-table)


(defun dividend (n m)
  (multiple-value-bind (q) (floor n m) q))

(defun create-binary-list (n size)
  (defun binary-list-with-zero (n)
    (if (= n 0)
	'(0)
	(append (binary-list-with-zero (dividend n 2))
		(list (mod n 2)))))
  
  (defun binary-list-without-zero (lst)
    (if (null (cdr lst))
	lst
	(cdr lst)))

  (defun create-init-list (init size)
    (if (= size 0)
	'()
	(append (list init) (create-init-list 0 (- size 1)))))
  
  (defun binary-list-with-extra-zeros (lst size)
    (let ((list-size (length lst)))
      (if (or (= list-size size) (= size 0))
	  lst
	  (append (create-init-list 0 (- size list-size)) lst))))
    
  (binary-list-with-extra-zeros (binary-list-without-zero
				 (binary-list-with-zero n))
				size))

(defun digit-to-bool (n)
  (if (numberp n)
      (if (= n 1) t nil)
      n))

(defun print-truth-table (bool-fn fn-name lparameters)
  (format t "--------------------------------~%")
  (format t "Function name: ~a~%" fn-name)
  (format t "--------------------------------~%")
  (dotimes (x (expt 2 lparameters))
    (let ((binary-list (create-binary-list x lparameters)))
      (format t "~a -> ~a~%" binary-list (digit-to-bool
					  (apply bool-fn binary-list))))))

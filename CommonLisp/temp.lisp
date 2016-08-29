(defun my-addition-function (&rest rest)
  "A quick and dirty addition function."
  (apply #'+ rest))

(my-addition-function 10 9 8 7 6 5 4 3 2 1)

(disassemble #'my-addition-function)

(defun partial-sum (f n)
  (labels ((range (a b)
                  (loop for i from a to b
                    collect i)))
          (apply '+
            (mapcar f (range 1 n)))))

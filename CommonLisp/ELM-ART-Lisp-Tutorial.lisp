(defun my-second (lst)
  (first (rest lst)))

(defun my-third (lst)
  (first (rest (rest lst))))

(defun third-in-first-sublist (lst)
  (first (rest (rest (first lst)))))

(defun perimeter-of-rectangle (side-a side-b)
  (+ (* 2 side-a) (* 2 side-b)))

(defun cuboid-volume-new (sides)
  (* (car sides) (cadr sides) (caddr sides)))

(defun weight-of-purchase (shopping-list)
  (+ (first (rest (first shopping-list)))
     (first (rest (first (rest shopping-list))))))

(defun weight-of-purchase (shopping-list)
  (+ (cadar shopping-list)
     (cadadr shopping-list)))

(defun change-head (l1 l2)
  (cons (car l2) (cdr l1)))

(defun replace-third (item lst)
  (cons (car lst)
	(cons (cadr lst)
	      (cons item (cdddr lst)))))

(defun insert-behind (elem lst)
  (reverse (cons elem (reverse lst))))

(defun remove-last (lst)
  (reverse (cdr (reverse lst))))

(defun replace-last (elem lst)
  (reverse (cons elem (cdr (reverse lst)))))

(defun add-lengths (lst1 lst2)
  (+ (length lst1) (length lst2)))

(defun add-length-to-list (lst)
  (insert-behind (length lst) lst))

(defun cold-p (arg)
  (equal arg 'cold))

(defun larger-15-p (num)
  (> num 15))

(defun palindrome-p (lst)
  (equal lst (reverse lst)))

(defun one-p (lst)
  (= (length lst) 1))

(defun more-than-two-p (lst)
  (> (length lst) 2))

(defun nrest (elem lst)
  (- (length (member elem lst)) 1))

(defun safe-less-p (num1 num2)
  (and (numberp num1)
       (numberp num2)
       (< num1 num2)))

(defun what-is-it (expr)
  (cond ((consp expr) 'list)
	((symbolp expr) 'atom)
	((numberp 'number))
	(t 'do-not-know)))

(defun compare (num1 num2)
  (cond ((< num1 num2) 'number1-is-smaller)
	((> num1 num2) 'number1-is-bigger)
	(t 'both-equal)))

(defun inserts (expr lst)
  (cond ((not (member expr lst)) (cons expr lst))
	(t lst)))

(defun my-member (expr lst)
  (cond ((endp lst) nil)
	((equal expr (first lst)) lst)
(defun make-cd (title artist rating ripped)
  (list :title title :artist artist :rating rating :ripped ripped))

(defvar *db* nil)

(defun add-record (cd) (push cd *db*))

(defun dump-db ()
  (dolist (cd *db*)
    (format t "~{~a:~10t~a~%~}~%" cd)))

(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun prompt-for-cd ()
  (make-cd
   (prompt-read "Title")
   (prompt-read "Artist")
   (or (parse-integer (prompt-read "Rating") :junk-allowed t) 0)
   (y-or-n-p "Ripped [y/n]")))

(defun add-cds ()
  (loop (add-record (prompt-for-cd))
     (if (not (y-or-n-p "Another? [y/n]: ")) (return))))

(defun save-db (filename)
  (with-open-file (out filename
		       :direction :output
		       :if-exists :supersede)
    (with-standard-io-syntax
      (print *db* out))))

	(t (my-member expr (rest lst)))))

(defun fib (n)
  (break)
  (if (<= n 1)
      (/ 1 0)
      (+ (fib (- n 1))
	 (fib (- n 2)))))

(defun multiples (x)
  (values (* 2 x) (* 3 x)))

(defun top-level-list-p (lst)
  (cond ((endp lst) t)
	((consp (first lst)) nil)
	(t (top-level-list-p (rest lst)))))

(defun contains-number-p (lst)
  (cond ((endp lst) nil)
	((numberp (first lst)) t)
	(t (contains-number-p (rest lst)))))

(defun monotonic-decreasing-p (numberlist)
  (cond ((endp numberlist) t)
	((endp (rest numberlist)) t)
	((< (first numberlist) (second numberlist)) nil)
	(t (monotonic-decreasing-p (rest numberlist)))))

(defun simple-and (truthvalues)
  (cond ((endp truthvalues) t)
	((not (first truthvalues)) nil)
	(t (simple-and (rest truthvalues)))))

(defun simple-or (truthvalues)
  (cond ((endp truthvalues) nil)
	((first truthvalues) t)
	(t (simple-or (rest truthvalues)))))

(defun x-in-list-p (lst)
  (cond ((endp lst) nil)
	((equal 'x (first lst)) t)
	(t (x-in-list-p (rest lst)))))

(defun all-same-as-element (atm lst)
  (cond ((endp lst) t)
	((not (equal (first lst) atm)) nil)
	(t (all-same-as-element atm (rest lst)))))

(defun monotonic-increasing-p (numlist)
  (cond ((endp numlist) t)
	((endp (rest numlist)) t)
	((> (first numlist) (second numlist)) nil)
	(t (monotonic-increasing-p (rest numlist)))))

(defun my-replace (expr1 expr2 lst)
  "This function replaces expr1 with expr2 in lst"
  (cond ((endp lst) nil)
	((equal (first lst) expr1)
	 (cons expr2
	       (my-replace expr1 expr2 (rest lst))))
	(t (cons (first lst)
		 (my-replace expr1 expr2 (rest lst))))))

(defun remove-first (expr lst)
  (cond ((endp lst) nil)
	((equal (first lst) expr) (rest lst))
	(t (cons (first lst)
		 (remove-first expr (rest lst))))))

(defun count-sublists (lst)
  (cond ((endp lst) 0)
	((consp (first lst))
	 (+ 1 (count-sublists (rest lst))))
	(t (count-sublists (rest lst)))))

(defun my-length (lst)
  (cond ((endp lst) 0)
	((or (atom (first lst)) (consp (first lst)))
	 (+ 1 (my-length (rest lst))))
	(t (my-length (rest lst)))))

(defun my-remove (expr lst)
  (cond ((endp lst) nil)
	((equal (first lst) expr)
	 (my-remove expr (rest lst)))
	(t (cons (first lst) (my-remove expr (rest lst))))))

(defun replace-first (expr1 expr2 lst)
  (cond ((endp lst) nil)
	((not (equal (first lst) expr1))
	 (cons (first lst)
	       (replace-first expr1 expr2 (rest lst))))
	(t (cons expr2 (rest lst)))))

(defun count-atoms (lst)
  (cond ((endp lst) 0)
	((not (atom (first lst)))
	 (count-atoms (rest lst)))
	(t (+ 1 (count-atoms (rest lst))))))

(defun test-list-for-item (elem lst)
  (cond ((endp lst) nil)
	((equal (first lst) elem)
	 (cons 't (test-list-for-item elem (rest lst))))
	(t (cons nil (test-list-for-item elem (rest lst))))))

(defun deep-member (expr lst)
  (cond ((endp lst) nil)
	((equal (first lst) expr) t)
	((atom (first lst))
	 (deep-member expr (rest lst)))
	(t (or (deep-member expr (first lst))
	       (deep-member expr (rest lst))))))

(defun deep-subst (expr1 expr2 lst)
  (cond ((endp lst) nil)
	((equal (first lst) expr1)
	 (cons expr2
	       (deep-subst expr1 expr2 (rest lst))))
	((atom (first lst))
	 (cons (first lst)
	       (deep-subst expr1 expr2 (rest lst))))
	(t (cons (deep-subst expr1 expr2 (first lst))
		 (deep-subst expr1 expr2 (rest lst))))))

(defun count-atoms (lst)
  (cond ((endp lst) 0)
	((atom (first lst))
	       (+ 1 (count-atoms (rest lst))))
	(t (+ (count-atoms (first lst))
	      (count-atoms (rest lst))))))

(defun anywhere-x-p (lst)
  (cond ((endp lst) nil)
	((equal 'x (first lst)) t)
	((atom (first lst))
	 (anywhere-x-p (rest lst)))
	(t (or (anywhere-x-p (first lst))
	       (anywhere-x-p (rest lst))))))

(defun deep-remove (expr lst)
  (cond ((endp lst) nil)
	((equal (first lst) expr)
	 (deep-remove expr (rest lst)))
	((atom (first lst))
	 (cons (first lst)
	       (deep-remove expr (rest lst))))
	(t (cons (deep-remove expr (first lst))
		 (deep-remove expr (rest lst))))))

(defun sum-all (numlst)
  (cond ((endp numlst) 0)
	((atom (first numlst))
	 (+ (first numlst) (sum-all (rest numlst))))
	(t (+ (sum-all (first numlst))
	      (sum-all (rest numlst))))))

(defun count-numbers (lst)
  (cond ((endp lst) 0)
	((numberp (first lst))
	 (+ 1 (count-numbers (rest lst))))
	((atom (first lst))
	 (count-numbers (rest lst)))
	(t (+ (count-numbers (first lst))
	      (count-numbers (rest lst))))))

(defun sum-numbers (lst)
  (cond ((endp lst) 0)
	((numberp (first lst))
	 (+ (first lst)
	    (sum-numbers (rest lst))))
	((atom (first lst))
	 (sum-numbers (rest lst)))
	(t (+ (sum-numbers (first lst))
	      (sum-numbers (rest lst))))))

(defun a-list-test (lst)
  (cond ((endp lst) t)
	((atom (first lst)) nil)
	(t (a-list-test (rest lst)))))

(defun count-item (expr lst)
  (cond ((endp lst) 0)
	((equal (first lst) expr)
	 (+ 1 (count-item expr (rest lst))))
	((atom (first lst))
	 (count-item expr (rest lst)))
	(t (+ (count-item expr (first lst))
		(count-item expr (rest lst))))))

(defun list-up-to-atom (lst)
  (cond ((endp lst) nil)
	((atom (first lst))
	 (cons (first lst) nil))
	(t (cons (first lst)
		 (list-up-to-atom (rest lst))))))

(defun average (a b)
  (* 0.5 (+ a b)))

(defun midpts (intervals)
  (cond ((endp (cdr intervals)) nil)
        (t (cons (average (car intervals)
                          (cadr intervals))
                 (midpts (cdr intervals))))))

(defun intervals (a b n)
  (let ((subintervals nil)
        (deltax (/ (- b a) n)))
    (dotimes (i (+ n 1))
      (push (+ a (* i deltax)) subintervals))
    (nreverse subintervals)))

(defun test-loop (n)
  (let ((lst nil))
    (dotimes (i n)
      (push (* 3 n) lst))
    (nreverse lst)))

(defun midpoint-rule (fun a b n)
  (let ((mid-points (midpts (intervals a b n)))
        (deltax (/ (- b a) n)))
    (* deltax (apply '+ (mapcar fun mid-points)))))

(defun comp-function (fun lst)
  (let ((mid-points (midpts lst)))
  (apply '+ (mapcar fun mid-points))))

(midpoint-rule #'(lambda (x) (sqrt x)) 1 9 50)

(midpoint-rule 'f 1 9 50)

(let ((lst nil))
  (dotimes (i 20)
    (push (midpoint-rule 'f 1 9 (* 2 (+ i 1))) lst))
(reverse lst))

(let ((lst nil))
  (dotimes (i 10)
    (push (* i i) lst))
  (reverse lst))

(defun my-+ (&rest terms)
  (apply '+ terms))

(defun list-of-pairs-p (lst)
  (cond ((endp lst) t)
        ((atom (car lst)) nil)
        ((not (= (length (car lst)) 2)) nil)
        (t (list-of-pairs-p (cdr lst)))))

(defun temp (f a b n)
  (apply '+
         (mapcar f (intervals a b n))))

(defun simpsons-rule (f a b n)
  (* (/ (- b a) (* 3 n))
     (apply '+
            (mapcar '* (simpsons-rule-coeffs n)
                    (mapcar f (intervals a b n))))))

(defun simpsons-rule-coeffs (m)
  (let ((n (+ m 1)))
       (loop for k from 1 to n
          collect (cond ((= k 1) 1)
                        ((= k n) 1)
                        ((evenp k) 4)
                        ((oddp k) 2)))))

(defun simpsons-rule-2 (f a b n)
  (let ((delta-x (/ (- b a) n))
        (my-sum 0))
    (loop for k from 0 to n
       do (let ((coeff (cond ((= k 0) 1)
                             ((= k n) 1)
                             ((evenp k) 2)
                             ((oddp k) 4)))
                (xk (+ a (* k delta-x))))
            (setf my-sum (+ my-sum
                            (* coeff (funcall f xk))))))
    (* my-sum (/ delta-x 3))))

;; Integration by Simpson's rule; CL code
;; Found to be working correctly with 'sbcl'

(defun simpsons (f a b n)
  (let ((summation 0)
        (h (/ (- b a) n)))
    (loop for k from 2 below (- n 1) by 2
       do (setf summation
                (+ summation
                   (* 2 (funcall f (+ (* k h) a))))))
    (loop for k from 1 below n by 2
       do (setf summation
                (+ summation
                   (* 4 (funcall f (+ (* k h) a))))))
    (setf summation
          (+ summation
             (funcall f a)
             (funcall f (+ (* n h) a))))
    (* (/ h 3.0) summation)))


(defun tmp (n)
  (loop for k from 0 to n
     do (let ((coeff (cond ((equal k nil) 0)
                           ((= k 0) 1)
                           ((= k n) 1)
                           ((evenp k) 2)
                           ((oddp k) 4)))
              (xk (* n 3)))
          (print coeff))))

(defun simp-coeff (k n)
           (cond ((= k 0) 1)
                 ((= k n) 1)
                 ((evenp k) 2)
                 ((oddp k) 4)))

(defun simpsons-rule-3 (f a b n)
           (let ((delta-x (/ (- b a) n))
                 (my-sum 0))
             (loop for k from 0 to n
                  do (let ((xk (+ a (* k delta-x))))
                       (setf my-sum (+ my-sum
                                       (* (simp-coeff k n)
                                          (funcall f xk))))))
             (* my-sum (/ delta-x 3))))

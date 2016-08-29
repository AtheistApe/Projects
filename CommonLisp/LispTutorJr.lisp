(require 'iterate)

(iterate:iter (iterate:for i from 1 to 20)
	      (print i))

(defun testfood (food)
  (cond ((equal food 'pizza) 'good)
        ((equal food 'peas) 'bad)
        ((equal food 'spinach) 'awful)
        (t 'ok)))

(defun compare (num1 num2)
  (> (+ 10 num1)
     (* 2 num2)))

(defun palp (lst)
  (equal lst (reverse lst)))

(defun safe-divide (num1 num2)
  (if (zerop num2)
      'zero
      (/ num1 num2)))

(defun my-abs (num)
  (if (< num 0)
      (- num)
      num))

(defun checktemp (temp)
  (cond ((> temp 80) 'hot)
        ((< temp 20) 'cold)
        (t 'medium)))

(defun classify (arg)
  (cond
   ((null arg) nil)
   ((listp arg) 'list)
   ((numberp arg) 'number)
   ((atom arg) 'atom)))

(defun samesign (num1 num2)
  (or
   (and (zerop num1) (zerop num2))
   (and (> num1 0) (> num2 0))
   (and (< num1 0) (< num2 0))))

(defun volume (box)
  (* (car box)
     (car (cdr box))
     (car (cdr (cdr box)))))

(defun repack (box1 box2)
  (/ (volume box1)
     (volume box2)))

(defun circle-area (radius)
  (* 3.14159 radius radius))

(defun find-circle (circle1-radius circle2-radius)
  (sqrt (/ (+ (circle-area circle1-radius)
              (circle-area circle2-radius))
        3.14159)))

(defun diag (area)
  (sqrt (* area 2)))

(defun coverup (diam area1 area2)
  (or (> diam (diag area1))
      (> diam (diag area2))))

(defun 2nd (list)
  (car (cdr list)))

(defun same-second (list1 list2)
  (equal (2nd list1)
         (2nd list2)))

(defun area (len)
  (* len len))

(defun stack-squares (len1 len2)
  (- (area len1)
     (area len2)))

(defun f (x)
  (cond ((<= x -2) (* x x))
        ((and (> x -2) (< x 2)) (* 2 x))
        ((>= x 2) 3)))

(defun sum-all (n)
  (cond ((zerop n) 0)
        (t (+ n (sum-all (1- n))))))

(defun sum-list (lst)
  (cond ((null lst) 0)
        (t (+ (car lst) (sum-list (cdr lst))))))

(defun fact (n)
  (cond ((zerop n) 1)
        (t (* n (fact (1- n))))))

(defun list-n (n expr)
  (cond ((zerop n) nil)
        (t (cons expr (list-n (1- n) expr)))))

(defun list-odd (n)
  (cond ((zerop n) nil)
        ((oddp n) (cons n (list-odd (1- n))))
        (t (list-odd (1- n)))))

(defun new-length (lst)
  (cond ((null lst) 0)
        (t (1+ (new-length (cdr lst))))))

(defun addn (lst n)
  (cond ((null lst) nil)
        (t (cons (+ n (car lst)) (addn (cdr lst) n)))))

(defun sum-numbers (lst)
  (cond ((null lst) 0)
        ((numberp (car lst)) (+ (car lst) (sum-numbers (cdr lst))))
        (t (sum-numbers (cdr lst)))))

(defun isin (elem lst)
  (cond ((null lst) nil)
        ((equal elem (car lst)) t)
        ((atom (car lst)) (isin elem (cdr lst)))
        (t (or (isin elem (car lst))
               (isin elem (cdr lst))))))

(defun numbers (lst)
  (cond ((null lst) nil)
        ((numberp (car lst)) (cons (car lst) (numbers (cdr lst))))
        ((atom (car lst)) (numbers (cdr lst)))
        (t (append (numbers (car lst)) (numbers (cdr lst))))))

(defun count-atoms (lst)
  (cond ((null lst) 0)
        ((atom (car lst)) (1+ (count-atoms (cdr lst))))
        (t (+ (count-atoms (car lst)) (count-atoms (cdr lst))))))

(defun flatten (lst)
  (cond ((null lst) nil)
        ((atom (car lst)) (cons (car lst) (flatten (cdr lst))))
        (t (append (flatten (car lst)) (flatten (cdr lst))))))

(defun find-nums (lst)
  (cond
   ((null lst) nil)
   ((numberp (car lst))
	(cons (car lst) (find-nums (cdr lst))))
   ((atom (car lst)) (find-nums (cdr lst)))
   (t (cons (find-nums (car lst)) 
            (find-nums (cdr lst))))))

(defun delete-all (lst atm)
  (cond
   ((null lst) nil)
   ((equal (car lst) atm) (delete-all (cdr lst) atm))
   ((atom (car lst)) (cons (car lst) (delete-all (cdr lst) atm)))
   (t (cons
       (delete-all (car lst) atm)
       (delete-all (cdr lst) atm)))))

(defun add-integers (last)
  (loop with sum = 0
    for i from 1 to last
    do (incf sum i)
     finally (return sum)))

(defun add-integers (last)
  (loop for i from 1 to last
     sum i))

(defun int-multiply (x y)
  (loop for i from 1 to y
       sum x))

(defun int-list (end)
  (loop for i from 0 to end
     collect i))

(defun add-reciprocals (last)
  (loop for i from 1 to last
     sum (/ 1 i)))

(defun fact (n)
  (loop with prod = 1
     for i from 1 to n
     do (setf prod (* prod i))
     finally (return prod)))

(defun create-list (n)
  (loop for i from 1 to n
     collect i))

(defun sum-squares (n)
  (loop for i from 1 to n
     sum (* i i)))

(defun list-doubles (n)
  (loop for i from 1 to n
     collect (* i 2)))

(defun double-list (lst)
  (loop for num in lst
     collect (* num 2)))

(defun new-reverse (lst)
  (loop with return-list = nil
     for item in lst
     do (setf return-list (cons item return-list))
     finally (return return-list)))

(defun sum-products (pairs)
  (loop for (x y) in pairs
     sum (* x y)))

(defun triples-to-pairs (triples)
  (loop for (x y z) in triples
     collect (list x z)))

(defun count-numbers (lst)
  (loop for elem in lst
     count (numberp elem)))

(defun sum-list (lst)
  (loop for num in lst
       sum num))
  
(defun flip-pairs (pairs)
  (loop for (x y) in pairs
       collect (list y x)))

(defun prod-nums (lst)
  (loop with prod = 1
     for elem in lst when (numberp elem)
     do (setf prod (* prod elem))
     finally (return prod)))

(defun save-atoms (lst)
  (loop for elem in lst when (atom elem)
     collect elem))


       
       

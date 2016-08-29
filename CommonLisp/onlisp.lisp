(defun count-instances (obj lsts)
  (labels ((instances-in (lst)
             (if (consp lst)
                 (+ (if (eq (car lst) obj) 1 0)
                    (instances-in (cdr lst)))
                 0)))
    (mapcar #()'instances-in lsts)))

# This function is not tail-recursive.
(defun our-length (lst)
  (if (null lst)
      0
      (1+ (our-length (cdr lst)))))

(defun our-find-if (fn lst)
  (if (funcall fn (car lst))
      (car lst)
      (our-find-if fn (cdr lst))))

# This function is tail-recursive.
(defun our-lenght-2 (lst)
  (labels ((rec (lst acc)
             (if (null lst)
                 acc
                 (rec (cdr lst) (1+ acc)))))
    (rec lst 0)))

(defun triangle (n)
  (labels ((tri (c n)
             (declare (type fixnum n c))
             (if (zerop n)
                 c
                 (tri (the fixnum (+ n c))
                      (the fixnum (- n 1))))))
    (tri 0 n)))

(defun make-adder (n)
  #'(lambda (x) (+ x n)))

(defun my-reverse (lst)
  (labels ((rev (lst acc)
             (if (null lst)
                 acc
                 (rev (cdr lst) (cons (car lst) acc)))))
    (rev lst nil)))

(defun my-range (n)
  (labels ((rng (n acc)
             (if (zerop n)
                 acc
                 (rng (1- n) (cons n acc)))))
    (rng n nil)))

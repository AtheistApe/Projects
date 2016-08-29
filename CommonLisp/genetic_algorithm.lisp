(defun make-random-citizen (size)
  (let ((s (make-array 0 :element-type 'character
                       :fill-pointer 0 :adjustable t)))
    (dotimes (i size s)
      (vector-push-extend (code-char (+ (random 90) 32)) s))))

(defun make-population (p-size c-size)
  (let ((p (make-array p-size)))
    (dotimes (i p-size p)
      (setf (svref p i) (make-random-citizen c-size)))))

(defun fitness (citizen target)
  (loop for x across citizen
     for y across target
     summing (abs (- (char-int x) (char-int y)))))

(defun mate (c1 c2 mutation-rate)
  (let* ((l (length c1))
         (spos (random (1+ l))))
    (flet ((mutate (x)
             (let ((ipos (random l))
                   (delta (+ (random 90) 32)))
               (setf (char x ipos)
                     (code-char (mod (+ delta
                                        (char-int (char x ipos)))
                                     122)))
               x)))
      (let ((m (concatenate 'string (subseq c1 0 spos)
                            (subseq c2 spos))))
        (if (< (random 1.0) mutation-rate) (mutate m) m)))))

(defun mate-population (pop1 pop2 elitism mutation-rate)
  (let* ((l (length pop1))
         (esize (floor (* l elitism)))
         (r (make-array 0 :element-type 'string
                        :fill-pointer 0 :adjustable t)))
    (concatenate
     'vector
     (subseq pop2 0 esize)
     (dotimes (i (- l esize) r)
         (vector-push-extend (mate (svref pop1 (random (/ l 2)))
                                   (svref pop2 (random (/ l 2)))
                                   mutation-rate)
                             r)))))

(defun sort-citizens (fitness population)
  (map-into population 'cdr
            (sort
             (map-into population (lambda (x)
                                    (cons (funcall fitness x) x))
                       population) '< :key 'car)))

(defun run-ga (&key (target "Connor Darius Church") (elitism .1)
                 (mrate .25) (popsize 2048) (maxiter 16384))
  (labels ((archievedp (citizen)
             (string-equal citizen target))
           (print-best (pop)
             (format t "Best: ~a (~d)~%" (svref pop 0)
                     (fitness (svref pop 0) target)))
           (evolve (i pop buf)
             (print-best pop)
             (if (or (zerop i) (archievedp (svref pop 0)))
                 (svref pop 0)
                 (evolve (1- i)
                         (mate-population
                          buf
                          (sort-citizens (lambda (x)
                                           (fitness x target)) pop)
                          elitism mrate)
                         pop))))
    (let ((initial-population
           (make-population popsize (length target))))
      (evolve maxiter initial-population initial-population))))

(defun test-fun (n)
  (let ((lst nil))
       (dotimes (i n)
         (setq lst (cons (code-char (+ (random 90) 32)) lst)))
       (princ lst)))

(defun harmonic-sum (total)
   (let ((sum 0) (n 0))
    (iterate (while (<= sum total))
             (setq n (+ n 1))
             (setq sum (+ sum (/ 1 n)))
             (collect (cons n (/ sum 1.0))))))

(defun partial-sum (fun n)
  (let ((sum 0))
    (iterate (for i from 1 to n)
             (setq sum (+ sum (funcall fun i))))
    sum))

(defun f (x)
  (/ 1.0 (* x x x)))

(define get-next-robot 
  (lambda (point)
    (let* ((lst1 (cons point (adjacento point))) 
           (lst0 (randomize lst1))
           (flst (calculate-h lst0))
           (lst (map list flst lst0))) 
      (set! queue '())
      (enqueue lst)
      (let ((num (random 10))
            (len (length lst0))
            (best (front)))
         (cond 
           ((= num 0)
              (list-ref lst0 (random len))) 
           (else
              best))))))

            
(define calculate-h
  (lambda (lst)
    (map h lst)))

(define h
  (lambda (point)
    (+ (abs (- (car point) (car goal)))
       (abs (- (cadr point) (cadr goal))))))


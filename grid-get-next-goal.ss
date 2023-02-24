(define get-next-goal 
  (lambda (point)
    (let* ((lst1 (cons point (adjacento point)))
           (lst0 (randomize lst1))
           (flst (calculate-h-goal lst0))
           (lst (map list flst lst0))) 
      (set! queue '())
      (enqueue lst)
      (set! queue (reverse queue))
      (let ((num (random 10))
            (len (length lst0))
            (best (front)))
         (cond 
           ((= num 0)
               (list-ref lst0 (random len))) 
            (else
               best))))))
 
(define calculate-h-goal
  (lambda (lst)
    (map h-goal lst)))

(define h-goal
  (lambda (point)
    (+ (abs (- (car point) (car robot)))
       (abs (- (cadr point) (cadr robot))))))   


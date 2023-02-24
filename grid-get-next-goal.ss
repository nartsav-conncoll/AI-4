(define g-ply 2)

(define get-next-goal 
  (lambda (point)
    (let* ((lst1 (cons point (adjacento point)))
           (lst0 (randomize lst1))
           (flst (calculate-h-goal lst0))
           (lst (map list flst lst0)))
      (set! queue '())
      (enqueue lst) ;((key item) (key item)...) syntax
      (set! queue (reverse queue))
      (let ((num (random 10))
            (len (length lst0))
            (best (front)))
         (cond 
           ((= num 0)
               (list-ref lst0 (random len))) 
            (else
               best))))))

; (g-minimax (adjacento goal) 0)

(define g-minimax
  (lambda (g-adjacentnodes counter)
    (cond 
    	(equal? counter g-ply) (display "reached bottom layer")
    	(moudlo counter)
    	()
    	;Once we've reached decision layer start calculating values of positions in the grid for our minimax graph
    ;else
       ; (enqueue list(g-minimax g-adjacentnodes list)))));creating the structure of the minimax graph through recursion
    
  ;  (if counter is even dequeue max lst);Technically these will never run. Fix this if statement
 ;   (else counter is odd dequeue min lst);Decision recursion up the minimax graph

;(define g-terminal ;This is the calculating terminal values function
  ;(lambda ()
    ;(set queue null);Important!!!! We also need to do this somewhere else because we only have one global queue. We could go around this by just using lists and using min and max.
    ;return(list of static function numbers paired with their position)));We enqueue this when we call it.
    
(define calculate-h-goal
  (lambda (lst)
    (map h-goal lst)))

(define h-goal
  (lambda (point)
    (+ (abs (- (car point) (car robot)))
       (abs (- (cadr point) (cadr robot))))))   


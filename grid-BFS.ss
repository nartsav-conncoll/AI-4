(define path-lst '())
(define goal -1)

(define expand
  (lambda (point)
    (let ((lst (adjacentv point)))
      (set-lst-visited lst)
      (add-to-path-lst lst point)
      (enqueue lst))))

(define add-to-path-lst
  (lambda (lst point)
    (if (not (null? lst))
       (let ((child-parent (list (car lst) point)))
         (set! path-lst (cons child-parent path-lst))
         (add-to-path-lst (cdr lst) point)))))

(define set-lst-visited
  (lambda (lst)
    (if (null? lst)
        '()
    ;else
        (let ((x (car lst)))
          (draw-pt-frontier x)
          (block-set! x visited)
          (set-lst-visited (cdr lst))))))
 
(define draw-pt-frontier
  (lambda (pt)
    (draw-frontier (car pt) (cadr pt))))

(define search
  (lambda (grid stop-count)
    (block-set! start visited)
    (set! path-lst (list (list start '())))
    (search2 grid 1 stop-count)))

(define search2
  (lambda (grid count stop-count)
    (display queue)
    (pause pause-num)
    (display count)
    (newline)
    (expand robot)
    (draw-moved-robot (robot-x) (robot-y))   
    (draw-visited (car robot) (cadr robot))
    (let ((next-robot (front)))
      (cond
        [(>= count stop-count) #f]
        [(equal? next-robot goal)(draw-path (get-path next-robot)) (draw-moved-robot (car next-robot) (cadr next-robot)) (get-path next-robot)]
        [else (dequeue)(set! robot next-robot)(search2 grid (+ count 1) stop-count)]
        ); cond paranthesis
     );let paranthesis
    );lambda paranthesis
)

   
(define get-path
  (lambda (last-node)
    (display path-lst)
    (newline)
    (cond
      [(equal? start last-node) (list start)]
      [else(display "entered")(cons last-node (get-path(cadr (assoc last-node path-lst))))]
      )
    
  )
)     
     
(define draw-path
  (lambda (path)
    (cond
      ((not (null? path))
         (draw-pt-path-node (car path))
         (draw-path (cdr path))))))
 
(define draw-pt-path-node
  (lambda (point)
    (draw-path-node (car point) (cadr point))))

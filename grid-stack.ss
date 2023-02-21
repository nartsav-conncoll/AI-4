(define stack '())

(define top
  (lambda ()
    (if (null? stack)
        '()
    ;else
        (car stack))))

(define pop
  (lambda ()
    (if (null? stack)
        '()
    ;else   
        (let ((temp (top)))
           (set! stack (cdr stack))
           temp))))

(define push
  (lambda (lst)
    (set! stack (append lst stack))))

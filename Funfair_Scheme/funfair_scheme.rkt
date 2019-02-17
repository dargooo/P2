;Dargo Wang
;COMP 3220 P2

#lang racket
(require (planet dyoo/simply-scheme:1:2/simply-scheme))

;return value of a ball
(define (ball-val ball)
  (cond
    [(equal? "R" ball) 10]
    [(equal? "G" ball) 15]
    [(equal? "B" ball) 20]
    [(equal? "W" ball) 1]))

;count the number of a color in a bucket
(define (count-balls color bucket)
(count (keep (lambda(c)(equal? color c)) bucket)))

;return the color numbers list of a bucket
(define (color-counts bucket)
  (cons (count-balls 'R bucket) (cons (count-balls 'G bucket) (cons (count-balls 'B bucket) (cons (count-balls 'W bucket) '())))))

;return the value of a bucket
(define (bucket-val bucket)
  (let ((val 0))
    (for-each (lambda(ball)
                (set! val (+ val (ball-val ball))))
              bucket)
    val))

;return the winner of bucket1 & bucket2
(define (judge bucket1 bucket2)
  (let((val1 (bucket-val bucket1)))
  (let((val2 (bucket-val bucket2)))
  (cond
    ((< val1 val2) (display "Bucket2, Won .. !")(newline))
    ((> val1 val2) (display"Bucket1, Won .. !")(newline))
    ((= val1 val2) (display"It's a Tie .. !")(newline))
  ))))

; ******** Competition 1 *********
(judge '(R B G R R R B W R W) '(W R R R R G B B G W))
;Bucket_1
(bucket-val '(R B G R R R B W R W))
(color-counts '(R B G R R R B W R W))

;Bucket_2
(bucket-val '(W R R R R G B B G W))
(color-counts '(W R R R R G B B G W))



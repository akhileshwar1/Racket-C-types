#lang racket

(define (func x)
  (define y 5)
  (define (func-1 y)
    (+ x y))
    (displayln (func 2)))


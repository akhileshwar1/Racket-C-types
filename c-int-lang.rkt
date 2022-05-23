#lang racket

(provide C)

; -------------------------------------------------------------------------------------------------
(require (for-syntax racket/list))
(require (for-syntax racket/match))
(require (for-syntax racket/syntax))
(require racket/stxparam)
(require (for-syntax syntax/parse))
(require rackunit)
(require syntax/macro-testing)
(require rackunit/text-ui)
(require (for-syntax modulo-lang))
(require (for-syntax "is-int-class.rkt"))
(require racket/trace)
; -------------------------------------------------------------------------------------------------

(define-syntax (C stx)
  (syntax-parse stx
    [(_ operator:function)
     #:with operator-c (format-id #'operator "~a-~a" #'operator #'c)
     #'(define-syntax (operator-c stx)
         (syntax-parse stx 
           [(_ ex:int (... ...)) 
            #'(operator ex (... ...))]))]))



(define-syntax (int stx)
  (syntax-parse stx
    [(_ name:id value:int)
     #'(define-syntax name (make-rename-transformer `,value))]))

#|(define-syntax (int stx)
  (syntax-parse stx
    [(_ name:id value:int)
     #'(define name value)])) |#

(define-syntax (check stx)
  (syntax-parse stx
    [(_ int int2)
     #'(+ int int2)]))


(define a 10)
(define c 14)
(check a c)
(C +)
(+-c 5 10)
(int b 5)
(+-c 5 b)
(+-c 5 (+ 5 10))

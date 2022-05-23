#lang racket

(provide
  ; syntax class that checks if an expr is an integer. 
  int)

; --------------------------------------------------------------------------------------------------- 
(require syntax/parse)
(require racket/stxparam)
(require (for-syntax syntax/parse))
; ---------------------------------------------------------------------------------------------------


(define-syntax-class int 
                     [pattern x:id
                              #:fail-when (eval #`(not (number? x)))
                              "not an integer"]
                     [pattern (~or* x:nat x:expr)
                              #:fail-when  (eval #'(not (number? x))) 
                              "not an integer"
                              ])

; The problem might be because of different lex scopes or of diff bindings.
; if new-name has a different scope then why does the rename work?
; therefore it may be the binding. why isn't it referencing it?
; oh it is the lex scope because the new-name is only available in the begin scope.
; define-syntax goes beyond itr
;
; THere is no way to take the new-name outside of begin/
; the way is to get the value of the identifier in the class and check.
; meaning to get it inside the syntax.
;
;
; I think the b problem should be in the quasi quote.
; does the environment change in the pattern context.
; and if so, does it not change in the syntax-parse state.
; I think it does change into a new one but the point is that it returns to the old environment.
; and in this case it does not/
; so it won't work/
;
; the only way is to send the number not the id to the class.
; for that evaluation has to happen before. BEFORE even going to syntax-parse.
; can we rename an int definition to a `,var form?
; maybe like (mk r #'`,var) but you can't rename it into a number.a
;
; what is the question?
; how can an identifier be checked for its value in compile time?
; Its impossible.
; What is the higher level question?
; what is a type in racket?
; Is it just an identifier change or something more?
; is it an identifier? No.
; I think racket's understanding of an identifier should be changed.
; that is the compiler itself has to be changed.

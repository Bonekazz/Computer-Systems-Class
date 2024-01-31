                BR          main
data:           .EQUATE     0               ;struct field #2d
next:           .EQUATE     2               ;struct field #2h

;-------------------- int main()

first:          .EQUATE     8                   ;local variable #2h
p:              .EQUATE     6                   ;local variable #2h
first2:         .EQUATE     4                   ;local variable #2h
p2:             .EQUATE     2                   ;local variable #2h
value:          .EQUATE     0                   ;local variable #2d

main:           SUBSP       10,     i           ;push #first #p #first2 #p2 #value
                LDWA        0,      i
                STWA        first,  s
                DECI        value,  s 

while:          LDWA        value,  s           ;while (value != -9999)
                CPWA        -9999,  i
                BREQ        endWhile

                LDWA        first,  s
                STWA        p,      s
                LDWA        4,      i
                CALL        malloc
                STWX        first,  s

                LDWA        value,  s
                LDWX        data,   i
                STWA        first,  sfx

                LDWA        p,      s
                LDWX        next,   i
                STWA        first,  sfx
                DECI        value,  s
                BR          while

endWhile:       LDWA        first,  s           
                STWA        p,      s
for1:           LDWA        p,      s           ;for(p = first; p != 0; p = p->next)
                CPWA        0,      i           
                BREQ        endFor1
                LDWX        data,   i
                DECO        p,      sfx
                LDBA        ' ',    i
                STBA        charOut,d
                LDWX        next,   i
                LDWA        p,      sfx
                STWA        p,      s
                BR          for1

endFor1:        LDBA        '\n',   i
                STBA        charOut,d

                LDWA        0,      i
                STWA        first2, s
                STWA        p2,     s

                LDWA        first,  s           
                STWA        p,      s
for2:           LDWA        p,      s           ;for(p = first; p != 0; p = p->next)
                CPWA        0,      i
                BREQ        endFor2
                LDWA        first2, s
                STWA        p2,     s

                LDWA        4,      i           ;first2 = (struct node *) malloc(sizeof (struct node));
                CALL        malloc
                STWX        first2, s

                LDWX        data,   i
                LDWA        p,      sfx
                STWA        first2, sfx
                LDWX        next,   i
                LDWA        p2,     s
                STWA        first2, sfx

                LDWX        next,   i
                LDWA        p,      sfx
                STWA        p,      s
                BR          for2

endFor2:        LDWA        first2, s
                STWA        p2,     s
for3:           LDWA        p2,      s           ;for (p2 = first2; p2 != 0; p2 = p2->next)
                CPWA        0,      i
                BREQ        endFor3

                LDWX        data,   i
                DECO        p2,     sfx
                LDBA        ' ',    i
                STBA        charOut,d

                LDWX        next,   i
                LDWA        p2,     sfx
                STWA        p2,     s
                BR          for3

endFor3:        ADDSP       10,     i           ;pop #value #p2 #first2 #p #first
                STOP


;
;******* malloc()
;        Precondition: A contains number of bytes
;        Postcondition: X contains pointer to bytes
malloc:  LDWX    hpPtr,d     ;returned pointer
         ADDA    hpPtr,d     ;allocate from heap
         STWA    hpPtr,d     ;update hpPtr
         RET                 
hpPtr:   .ADDRSS heap        ;address of next free byte
heap:    .BLOCK  1           ;first byte in the heap
         .END
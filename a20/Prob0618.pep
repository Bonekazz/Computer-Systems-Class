            BR      main
;----------------- int times(int mpr, int mcand)  
mcand:      .EQUATE     2           ;formal #2d
mpr:        .EQUATE     4           ;formal #2d
retVal:     .EQUATE     6           ;return #2d

times:      LDWA        0,      i 
if:         CPWA        mpr,    s
            BRNE        elseIf
            STWA        retVal, s
            RET
elseIf:     LDWA        mpr,    s   ;if(mpr % 2 == 1)
            RORA        
            BRC         elseIf2
            BR          else

elseIf2:    LDWA        mpr,    s   ;return times(mpr / 2, mcand * 2) + mcand
            ASRA
            STWA        -4,     s   ;move mpr / 2
            LDWA        mcand,  s
            ASLA        
            STWA        -6,     s   ;move mcand * 2
            SUBSP       6,      i   ;push #retVal #mpr #mcand
            CALL        times 
            ADDSP       6,      i   ;pop #mcand #mpr #retVal
            LDWA        -2,     s
            ADDA        mcand,     s
            STWA        retVal, s 
            RET

else:       LDWA        mpr,    s   ;return times(mpr / 2, mcand * 2) + mcand
            ASRA
            STWA        -4,     s   ;move mpr / 2
            LDWA        mcand,  s
            ASLA        
            STWA        -6,     s   ;move mcand * 2
            SUBSP       6,      i   ;push #retVal #mpr #mcand
            CALL        times 
            ADDSP       6,      i   ;pop #mcand #mpr #retVal
            LDWA        -2,     s
            STWA        retVal, s 
            RET


;----------------- int main()------------
n:          .EQUATE     2           ;local variable #2d
m:          .EQUATE     0           ;local variable #2d
main:       SUBSP       4,      i   ;push #n #m
            DECI        n,      s
            DECI        m,      s
            LDWA        n,      s
            STWA        -4,     s
            LDWA        m,      s
            STWA        -6,     s
            SUBSP       6,      i   ;push #retVal #mpr #mcand
            CALL        times
            ADDSP       10,     i   ;pop #mcand #mpr #retVal #m #n
            STRO        msg,    d
            DECO        -6,     s           
            STOP
msg:        .ASCII      "Product: \x00"
            .END
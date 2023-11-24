            BR          main
ch:         .EQUATE     0           ;local variable #1c
main:       SUBSP       1,      i   ;push #ch
if:         LDBA        charIn, d 
            STBA        ch,     s
            CPBA        'A',    i
            BRLT        elseIf
            CPBA        'Z',    i
            BRGT        elseIf
            LDBA        'A',    i   ;printf("A")
            STBA        charOut,d
            BR          endIf
elseIf:     LDBA        ch,     s
            CPBA        'a',    i
            BRLT        else
            CPBA        'z',    i
            BRGT        else
            LDBA        'a',    i   ;printf("a")
            STBA        charOut,d 
            BR          endIf
else:       LDBA        '$',    i   ;printf("$")
            STBA        charOut,d
endIf:      ADDSP       1,      i   ;pop #ch
            LDBA        '\n',   i   ;printf("\n")
            STBA        charOut,d
            STOP
            .END
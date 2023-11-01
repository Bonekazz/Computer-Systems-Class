         BR main
h:       .EQUATE 'H'   ;global variable #1c
i:       .EQUATE 'i'   ;global variable #1c
e:       .EQUATE 'e'   ;global variable #1c
r1:      .EQUATE 'r'   ;global variable #1c
r2:      .EQUATE 'r'   ;global variable #1c 
o:       .EQUATE 'o'   ;global variable #1c
main:    LDBA h, i
         STBA 0xFC16, d
         LDBA i, i
         STBA 0xFC16, d
         LDBA e, i
         STBA 0xFC16, d
         LDBA r1, i
         STBA 0xFC16, d
         LDBA r2, i
         STBA 0xFC16, d
         LDBA o, i
         STBA 0xFC16, d
STOP
.END
         BR main
h:       .EQUATE 72    ;global variable #1d
i:       .EQUATE 105   ;global variable #1d
e:       .EQUATE 101   ;global variable #1d
r1:      .EQUATE 114   ;global variable #1d
r2:      .EQUATE 114   ;global variable #1d 
o:       .EQUATE 111   ;global variable #1d
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
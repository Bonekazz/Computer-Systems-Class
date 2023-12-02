            BR          main  

;--------------void towerOfHanoi(int n, string from_rod,string  to_rod, string aux_rod)

;ret address------------0
auxRod:        .EQUATE     2                ;formal #1c
toRod:         .EQUATE     3                ;formal #1c
fromRod:       .EQUATE     4                ;formal #1c
n:             .EQUATE     5                ;formal #2d 

towHanoi:       LDWA        n,          s   ;if(n == 1)
                CPWA        1,          i
                BRNE        else

                STRO        msg,        d   ;"Move disk 1 from rod" << from_rod <<  "to rod"  << to_rod << endl;
                LDBA        fromRod,    s
                STBA        charOut,    d
                STRO        msg3,       d
                LDBA        toRod,      s 
                STBA        charOut,    d
                LDBA        '\n',       i
                STBA        charOut,    d
                RET

else:           LDWA        n,          s   ;towerOfHanoi(n-1, from_rod, aux_rod, to_rod);
                SUBA        1,          i
                STWA        -2,         s 
                LDBA        fromRod,    s
                STBA        -3,         s
                LDBA        auxRod,     s
                STBA        -4,         s
                LDBA        toRod,      s
                STBA        -5,         s
                SUBSP       5,          i   ;push #n #fromRod #toRod #auxRod 
                CALL        towHanoi
                ADDSP       5,          i   ;pop #auxRod #toRod #fromRod #n

                STRO        msg1,       d   ;"Move disk" << n <<  "from rod"  << from_rod <<  "to rod " << to_rod << endl;
                DECO        n,          s
                STRO        msg2,       d
                LDBA        fromRod,    s 
                STBA        charOut,    d
                STRO        msg3,       d
                LDBA        toRod,      s 
                STBA        charOut,    d
                LDBA        '\n',       i
                STBA        charOut,    d

                LDWA        n,          s   ;towerOfHanoi(n-1, aux_rod, to_rod, from_rod);
                SUBA        1,          i
                STWA        -2,         s 
                LDBA        auxRod,    s
                STBA        -3,         s
                LDBA        toRod,     s
                STBA        -4,         s
                LDBA        fromRod,   s
                STBA        -5,         s
                SUBSP       5,          i   ;push #n #fromRod #toRod #auxRod
                CALL        towHanoi
                ADDSP       5,          i   ;pop #auxRod #toRod #fromRod #n
                RET

msg:            .ASCII      "Move disk 1 from rod \x00"
msg1:           .ASCII      "Move disk \x00"
msg2:           .ASCII      " from rod \x00"
msg3:           .ASCII      " to rod \x00"
              

;----------------- int main()

x:              .EQUATE     0               ;local variable #2d

main:           SUBSP       2,          i   ;push #x
                DECI        x,          s
                LDWA        x,          s 
                STWA        -2,         s
                LDBA        'A',        i 
                STBA        -3,         s
                LDBA        'C',        i 
                STBA        -4,         s 
                LDBA        'B',        i
                STBA        -5,         s
                
                SUBSP       5,          i   ;push #n #fromRod #toRod #auxRod
                CALL        towHanoi 
                ADDSP       7,          i   ;pop #auxRod #toRod #fromRod #n #x
                STOP
                .END
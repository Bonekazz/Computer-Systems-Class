
        BR          main
list:       .BLOCK      32                  ;global #2d16a
j:          .BLOCK      2                   ;global #2d
numItems:   .BLOCK      2                   ;global #2d
temp:       .BLOCK      2                   ;global #2d

;-------------- int main()

main:       DECI        numItems,   d
            LDWX        0,          i       
            STWX        j,          d
for1:       LDWX        j,          d       ;for(j = 0; j < numItems; j++)
            CPWX        numItems,   d
            BRGE        endFor1
            ASLX
            DECI        list,       x       ;scanf("%d", &list[j]) 
            LDWX        j,          d
            ADDX        1,          i       ;j++
            STWX        j,          d
            BR          for1   

endFor1:    LDWX        0,          i
            ASLX        
            LDWA        list,       x
            STWA        temp,       d

            LDWX        0,          i
            STWX        j,          d
for2:       LDWA        numItems,   d       ;for(j = 0; j < numItems - 1; j++)
            SUBA        1,          i
            CPWA        j,          d
            BRGE        endFor2
            LDWX        j,          d
            ADDX        1,          i
            ASLX
            LDWA        list,       x
            LDWX        j,          d
            ASLX
            STWA        list,       x
            LDWA        j,          d
            ADDA        1,          i
            STWA        j,          d
            BR          for2

endFor2:    LDWX        numItems,   d
            SUBX        1,          i
            ASLX
            STWX        temp,       d  

            LDWX        0,          i
            STWX        j,          d
for3:       LDWX        j,          d       ;for(j = 0; j < numItems; j++)
            CPWX        numItems,   d
            BRGE        endFor3
            ASLX
            DECO        list,       x       ;scanf("%d", &list[j])
            LDBA        ' ',        i
            STBA        charOut,    d  
            LDWX        j,          d
            ADDX        1,          i       ;j++
            STWX        j,          d
            BR          for3

endFor3:    LDBA        '\n',       i
            STBA        charOut,    d
            STOP
            .END
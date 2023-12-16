        BR          main

;-------------- int main()

temp:       .EQUATE      0                  ;local #2d
numItems:   .EQUATE      2                  ;local #2d
j:          .EQUATE      4                  ;local #2d
list:       .EQUATE      6                  ;local #2d16a

main:       SUBSP       38,         i       ;push #list #j #numItems #temp 
            DECI        numItems,   s
            LDWX        0,          i       
            STWX        j,          s
for1:       LDWX        j,          s       ;for(j = 0; j < numItems; j++)
            CPWX        numItems,   s
            BRGE        endFor1
            ASLX
            DECI        list,       sx       ;scanf("%d", &list[j]) 
            LDWX        j,          s
            ADDX        1,          i       ;j++
            STWX        j,          s
            BR          for1   

endFor1:    LDWX        0,          i
            ASLX        
            LDWA        list,       sx
            STWA        temp,       s

            LDWX        0,          i
            STWX        j,          s
for2:       LDWA        numItems,   s       ;for(j = 0; j < numItems - 1; j++)
            SUBA        1,          i
            CPWA        j,          s
            BRGE        endFor2
            LDWX        j,          s
            ADDX        1,          i
            ASLX
            LDWA        list,       sx
            LDWX        j,          s
            ASLX
            STWA        list,       sx
            LDWA        j,          s
            ADDA        1,          i
            STWA        j,          s
            BR          for2

endFor2:    LDWX        numItems,   s
            SUBX        1,          i
            ASLX
            STWX        temp,       s  

            LDWX        0,          i
            STWX        j,          s
for3:       LDWX        j,          s       ;for(j = 0; j < numItems; j++)
            CPWX        numItems,   s
            BRGE        endFor3
            ASLX
            DECO        list,       sx       ;scanf("%d", &list[j])
            LDBA        ' ',        i
            STBA        charOut,    d  
            LDWX        j,          s
            ADDX        1,          i       ;j++
            STWX        j,          s
            BR          for3

endFor3:    LDBA        '\n',       i
            STBA        charOut,    s
            SUBSP       38,         i       ;pop #temp #numItems #j #list     
            STOP
            .END
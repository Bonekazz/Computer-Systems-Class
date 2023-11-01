         BR      main        
width:   .BLOCK  2           ;global variable #2d
length:  .BLOCK  2           ;global variable #2d
perim:   .BLOCK  2           ;global variable #2d
main:    DECI    width,d     
         DECI    length,d    
         LDWA    width,d     
         ADDA    length,d    
         ASLA                
         STWA    perim,d     
         STRO    msg1,d      
         DECO    width,d     
         LDBA    '\n',i      
         STBA    charOut,d   
         STRO    msg2,d      
         DECO    length,d    
         LDBA    '\n',i      
         STBA    charOut,d   
         STRO    msg3,d      
         DECO    perim,d     
         STOP                
msg1:    .ASCII  "width = \x00"



msg2:    .ASCII  "length = \x00"



msg3:    .ASCII  "perim = \x00"

         .END                  

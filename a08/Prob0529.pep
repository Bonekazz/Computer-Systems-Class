         BR      main        
num1:    .BLOCK  2           ;global variable #2d
num2:    .BLOCK  2           ;global variable #2d

main:    DECI    num1,d      
         LDWA    num1,d      
         NEGA                
         STWA    num2,d      
         STRO    msg1,d      
         DECO    num1,d      
         LDBA    '\n',i      
         STBA    charOut,d   
         STRO    msg2,d      
         DECO    num2,d      
         STOP                
msg1:    .ASCII  "num1 = \x00"




msg2:    .ASCII  "num2 = \x00"


         .END                  

                BR          main

guess:          .EQUATE     0               ;local variable #2d

main:           SUBSP       2,      i       ;push #guess
                STRO        msg1,   d
                DECI        guess,  s
                LDWX        guess,  s       ;switch (guess)
                ASLX
                BR          guessJT,x 
guessJT:        .ADDRSS     case1 
                .ADDRSS     case1
                .ADDRSS     case2
                .ADDRSS     case3

case1:          STRO        msg2,   d
                BR          endCase
case2:          STRO        msg3,   d
                BR          endCase
case3:          STRO        msg4,   d

endCase:        ADDSP       2,      i       ;pop #guess
                LDBA        "\n",   i
                STBA        charOut,d
                STOP

msg1:           .ASCII      "Pick a number 0..3: \x00" 
msg2:           .ASCII      "Too low\x00"
msg3:           .ASCII      "Right on\x00"
msg4:           .ASCII      "Too high\x00"
                .END
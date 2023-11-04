// STATES = ROWS
const A = 0;
const B = 1;
const C = 2;
// ALPHABET = COLUMNS
const LETTER = 0;
const DIGIT = 1;
const OTHER = 2;
// State transition table
const FSM = [
    [ B, C, C ],
    [ B, B, C ],
    [ C, C, C ]
];

function isValid(c) {
    let lowerC = c.toLowerCase();
    if (lowerC >= 'a' && lowerC <= 'z') return LETTER;
    if (lowerC >= '0' && lowerC <= '9') return DIGIT;
    return OTHER;
}

function main() {
    let line = "";
    let ch;
    let FSMChar;
    let state = A;

    // Interface for reading data from a stream
    const readLine = require('readline').createInterface({
        input: process.stdin,
        output: process.stdout
    })

    readLine.question('write something: ', x => {

        for (let i = 0; i < x.length; i++) {
            if (x[ i ] === " ") {
                continue
            }
            line += x[ i ];
        }

        for (let i = 0; i < line.length; i++) {
            ch = line[ i ];
            FSMChar = isValid(ch)
            state = FSM[ state ][ FSMChar ];
        }

        if (state === B) { // B beeing a final state;
            console.log("your input is a valid identifier");
        } else {
            console.log("your string is not a valid identifier")
        }

        readLine.close();
    })
}

main();
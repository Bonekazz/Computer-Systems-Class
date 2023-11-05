import hexToDec from "./Utils/hexConverter.js";
export default class Parser {
    constructor() {
        this.valid = false;
        this.number = 0;
        this.hex = "";
        this.numState = {
            S_I: 0,
            S_F: 1,
            S_M: 2,
            S_STOP: 3
        }
        this.hexState = {
            S_A: 0,
            S_B: 1,
            S_STOP: 2 
        }
    }

    getValid() {
        return this.valid;
    }

    getNumber() {
        return this.number;
    }

    getHex() {
        return this.hex;
    }

    isDigit(ch) {
        return ('0' <= ch) && (ch <= '9');
    }

    isHex(ch) {
        return (ch >= 'a') && (ch <= 'f') ||  (ch >= 'A') && (ch <= 'F');
    }

    parseNum(line) {
        line += '\n';
        let lineIndex = 0;
        let nextChar = "";
        let sign = +1;
        this.valid = true;
        let state = this.numState.S_I;

        do {
            nextChar = line[ lineIndex++ ];
            switch (state) {
                case this.numState.S_I:
                    if (nextChar === '+') {
                        sign = +1;
                        state = this.numState.S_F;
                        break;
                    }
                    if (nextChar === '-') {
                        sign = -1;
                        state = this.numState.S_F;
                        break;
                    }
                    if (this.isDigit(nextChar)) {
                        sign = +1;
                        this.number = Number(nextChar);
                        state = this.numState.S_M;
                        break;
                    }
                    this.valid = false;
                    break;
                case this.numState.S_F:
                    if (this.isDigit(nextChar)) {
                        this.number = Number(nextChar);
                        state = this.numState.S_M;
                        break;
                    }
                    this.valid = false;
                    break;
                case this.numState.S_M:
                    if (this.isDigit(nextChar)) {
                        this.number = 10 * this.number + Number(nextChar);
                        break;
                    }
                    if (nextChar === '\n') {
                        this.number = sign * this.number;
                        state = this.numState.S_STOP;
                        break;
                    }
                    this.valid = false;
                    break;
            }
        } while ((state !== this.numState.S_STOP) && this.valid);
    }

    parseHex(line) {
        if (line.length > 4) {
            console.log("ERROR: the hex number must be less than 2bytes")
            return;
        }
        line += '\n';
        let lineIndex = 0;
        let nextChar = "";
        this.valid = true;
        let state = this.hexState.S_A;

        do {
        
            nextChar = line[ lineIndex++ ];
            switch (state) {
                case this.hexState.S_A:
                    if (this.isHex(nextChar) || this.isDigit(nextChar)) {
                        state = this.hexState.S_B;
                        this.hex += nextChar;
                        break;
                    }
                    this.valid = false;
                    break;
                case this.hexState.S_B:
                    if (this.isHex(nextChar) || this.isDigit(nextChar)) {
                        state = this.hexState.S_B;
                        this.hex += nextChar;
                        break;
                    }
                    if (nextChar === '\n') {
                        this.number = hexToDec(this.hex);
                        state = this.hexState.S_STOP;
                        break;
                    }
                    this.valid = false;
                    break;

            }
        
        } while ((state !== this.hexState.S_STOP) && this.valid)
    }
}
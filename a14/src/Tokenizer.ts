import InBuffer from './InBuffer.ts';
import AToken, { TEmpty, TInvalid, TInteger, TIdentifier, THex, TDotCommand, TAddress } from './Tokens.ts'
import Util, { LexState } from './Utils.ts'


export default class Tokenizer {
    private b: InBuffer;

    constructor(inBuffer: InBuffer) {
        this.b = inBuffer;
    }

    getToken(): AToken{
        let nextChar = "";
        let localStringValue = "";
        let localIntValue = 0;
        let sign = +1;
        let aToken = new TEmpty();
        let state = LexState.START;

        do {
            nextChar = this.b.returnAndAdvanceInput();
            switch (state) {
                case LexState.START:
                    if (nextChar === "0") {
                        localStringValue = nextChar;
                        state = LexState.INT1;
                        break;
                    }

                    if (Util.isDigit(nextChar)) {
                        localIntValue = Number(nextChar);
                        state = LexState.INT2;
                        break;
                    }

                    if (nextChar === '-') {
                        sign = -1;
                        state = LexState.SIGN;
                        break;
                    }
                    if (nextChar === '+') {
                        sign = +1;
                        state = LexState.SIGN;
                        break;
                    }

                    if (Util.isAlpha(nextChar)) {
                        localStringValue = nextChar;
                        state = LexState.IDENTIFIER;
                        break;
                    }

                    if (nextChar === '.') {
                        localStringValue = nextChar;
                        state = LexState.DOT1;
                        break;
                    }

                    if (nextChar === ',') {
                        state = LexState.ADDR1;
                        break;
                    }

                    if (nextChar === '\n' || nextChar.charCodeAt(0) === 13) {
                        state = LexState.STOP;
                        break;
                    }

                    if (nextChar !== ' ') {
                        aToken = new TInvalid();
                        break;
                    }
                    
                    break;
                
                case LexState.INT1:
                    if (nextChar === 'x' || nextChar === 'X') {
                        localStringValue += nextChar;
                        state = LexState.HEX1;
                        break;
                    }

                    if (Util.isDigit(nextChar)) {
                        localIntValue = 10 * localIntValue + Number(nextChar);
                        state = LexState.INT2;
                        break;
                    }

                    this.b.backUpInput();
                    aToken = new TInteger(localIntValue);
                    state = LexState.STOP;
                    break;

                case LexState.INT2:
                    if (localIntValue >= 65535 && sign === 1) {
                        aToken = new TInvalid(true);
                        break;
                    }

                    if (localIntValue >= 32768 && sign === -1) {
                        aToken = new TInvalid(true);
                        break;
                    }

                    if (Util.isDigit(nextChar)) {
                        localIntValue = 10 * localIntValue + Number(nextChar);
                        break;
                    }

                    this.b.backUpInput();
                    aToken = new TInteger(sign * localIntValue);
                    state = LexState.STOP;
                    break;
                
                case LexState.SIGN:
                    if (Util.isDigit(nextChar)) {
                        localIntValue = 10 * localIntValue + Number(nextChar);
                        state = LexState.INT2;
                        break;
                    }

                    aToken = new TInvalid(); 
                    break;
                
                case LexState.HEX1:
                    if (Util.isHex(nextChar)) {
                        localStringValue += nextChar;
                        state = LexState.HEX2;
                        break;
                    }

                    aToken = new TInvalid();
                    break;
                
                case LexState.HEX2:
                    if (Util.isHex(nextChar)) {
                        localStringValue += nextChar;
                        break;
                    }

                    if (Number(localStringValue) >= 65535) {
                        aToken = new TInvalid(true);
                        break;
                    }

                    this.b.backUpInput();
                    aToken = new THex(Number(localStringValue));
                    state = LexState.STOP;
                    break;
                
                case LexState.IDENTIFIER:
                    if (Util.isAlpha(nextChar) || Util.isDigit(nextChar)) {
                        localStringValue += nextChar;
                        break;
                    }

                    this.b.backUpInput();
                    aToken = new TIdentifier(localStringValue);
                    state = LexState.STOP;
                    break;

                case LexState.DOT1:
                    if (Util.isAlpha(nextChar)) {
                        localStringValue += nextChar;
                        state = LexState.DOT2;
                        break;
                    }

                    aToken = new TInvalid();
                    break;

                case LexState.DOT2:
                    if (Util.isAlpha(nextChar)) {
                        localStringValue += nextChar;
                        break;
                    }

                    this.b.backUpInput();
                    aToken = new TDotCommand(localStringValue);
                    state = LexState.STOP;
                    break;

                case LexState.ADDR1:
                    if (Util.isAlpha(nextChar)) {
                        localStringValue += nextChar;
                        state = LexState.ADDR2;
                        break;
                    }

                    if (nextChar !== ' ') {
                        aToken = new TInvalid();
                        break;
                    }
                    
                    break;
                
                case LexState.ADDR2:
                    if (Util.isAlpha(nextChar)) {
                        localStringValue += nextChar;
                        break;
                    }

                    this.b.backUpInput();
                    aToken = new TAddress(localStringValue);
                    state = LexState.STOP;
                    break;
                
                default:
                    console.log("something went wrong")
            }

        } while ((state != LexState.STOP) && !(aToken instanceof (TInvalid)));

        return aToken;

    }
}
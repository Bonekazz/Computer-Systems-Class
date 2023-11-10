export default class Util {
    static isDigit(ch: string) {
        return (ch >= '1') && (ch <= '9');
    }

    static isAlpha(ch: string) {
        let lower = ch.toLowerCase();
        return (lower >= 'a') && (lower <= 'z');
    }

    static isHex(ch: string) {
        let lower = ch.toLowerCase();
        return ((lower >= '0') && (lower <= '9') || (lower >= 'a') && (lower <= 'f'));
    }
}

export enum LexState {
    START, INT1, INT2, HEX1, HEX2, SIGN, IDENTIFIER, DOT1, DOT2, ADDR1, ADDR2, STOP
}
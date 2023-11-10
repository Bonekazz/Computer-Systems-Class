
/**
 *  @abstract
 */
export default abstract class AToken {
    abstract getDescription(): string;      // prints the token type and its value;
}

export class TEmpty extends AToken {
    constructor() { 
        super();
    };

    getDescription(): string {
        return "Empty Token";
    }
}

export class TInvalid extends AToken {
    private range: boolean;

    constructor(isOut: boolean = false) { 
        super();
        this.range = isOut;
    };

    getDescription(): string {
        if (this.range) {
            return "Out of Range"
        }

        return "Syntax Error";
    }
}
export class TInteger extends AToken {
    private intValue: number;

    constructor(int: number) {
        super();
        this.intValue = int;
    };

    getDescription(): string {
        return `Integer               = ${this.intValue}`
    }
}

export class THex extends AToken {
    private hexValue: number;

    constructor(hex: number) {
        super();
        this.hexValue = hex;
    }

    getDescription(): string {
        return `HexaDecimal          = ${this.hexValue}`
    }
}

export class TIdentifier extends AToken {
    private stringValue = "";

    constructor(stringBuffer: string) {
        super();
        this.stringValue = stringBuffer;
    };

    getDescription(): string {
        return `Identifier           = ${this.stringValue}`
    }
}

export class TDotCommand extends AToken {
    private dotCommand: string;

    constructor(commandString: string) {
        super();
        this.dotCommand = commandString;
    }

    getDescription(): string {
       return `DotCommand           = ${this.dotCommand}` 
    }
}

export class TAddress extends AToken {
    private adress: string;

    constructor(adressString: string) {
        super();
        this.adress = adressString;
    }

    getDescription(): string {
       return `Addressing Mode      = ${this.adress}` 
    }
}
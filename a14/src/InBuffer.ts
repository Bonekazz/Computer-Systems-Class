export default class InBuffer {

    private inString: string;                 // the whole string
    private line: string = "";           // one line
    private lineIndex: number = 0;      // where you are at the line;
    
    constructor(string: string) {
        this.inString = string + "\n\n";    // To guarantee inString.length === 0 eventualy;
    }

    getLine(): void{
        const i = this.inString.indexOf('\n');              // detects the first line by getting the index of the first appearence of '\n' in the whole string;
        this.line = this.inString.substring(0, (i + 1));    // gets that first line;
        this.inString = this.inString.substring((i + 1));        // cuts off the first line of the whole string
        this.lineIndex = 0;
    }

    inputRemains(): boolean{
        return this.inString.length !== 0;
    }

    advanceInput(): string{
        return this.line[ this.lineIndex++ ];
    }

    backUpInput(): void{
        this.lineIndex--;
    }
}
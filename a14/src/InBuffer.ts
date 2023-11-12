export default class InBuffer {

    private inputString: string;  
    private line: string = "";           
    private lineIndex: number = 0;      
    
    constructor(string: string) {
        this.inputString = string + "\n\n";    // To guarantee inString.length === 0 eventualy;
    }

    cutFirstLine(): void{
        const i = this.inputString.indexOf('\n'); 
        this.line = this.inputString.substring(0, (i + 1));    
        this.inputString = this.inputString.substring((i + 1));        
        this.lineIndex = 0;
    }

    inputRemains(): boolean{
        return this.inputString.length !== 0;
    }

    returnAndAdvanceInput(): string{
        return this.line[ this.lineIndex++ ];   // returning the value and then incrementing lineIndex;
    }

    backUpInput(): void{
        this.lineIndex--;
    }
}
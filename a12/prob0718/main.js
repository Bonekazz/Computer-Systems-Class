import Parser from './Parser.js'
import * as readline from 'readline'

function main() {

    // Interface for reading data from a stream
    const rl = readline.createInterface({
        input: process.stdin,
        output: process.stdout
    })

    rl.question('write something: ', x => {
        const line = x;
        const parser = new Parser();
        //parser.parseNum(line);
    
        //if (parser.getValid()) {
        //    console.log(`Number = ${parser.getNumber()}`)
        //} else {
        //    console.log("Invalid entry");
        //}

        parser.parseHex(line);
        if (parser.getValid()) {
            console.log(`${parser.getHex()} is valid --> number: ${parser.getNumber()}`)
        } else {
            console.log("invalid entry")
        }
        rl.close();
    })
}

main();
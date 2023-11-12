import Tokenizer from './Tokenizer.ts';
import InBuffer from './InBuffer.ts'
import AToken, { TEmpty, TInvalid } from './Tokens.ts'

// import * as readline from 'node:readline';
import * as fs from 'node:fs'

// TODO: Debug function;

// Read a file;

fs.readFile('./test/text.txt', 'utf8', (err, data) => {
    if (err) {
        console.error(err);
        return;
    }

    actionPerformed(data);
})

// const rl = readline.createInterface({
 //    input: process.stdin,
 //    output: process.stdout
// })

// rl.question("Write Something: ", x => {
//     const inBuffer = new InBuffer(x);               // Takes the whole user input string and give to the buffer
//     const tokenizer = new Tokenizer(inBuffer);      // Tokenize all the content of the buffer
//     let aToken: AToken;
//     inBuffer.getLine();
// 
//     while (inBuffer.inputRemains()) {

//         do {

//             aToken = tokenizer.getToken();
//             console.log(aToken.getDescription());

 //        } while (!(aToken instanceof TEmpty) && !(aToken instanceof TInvalid));

//         inBuffer.getLine();
//     }
    
    
//     rl.close();
// })

function actionPerformed(data: string) {
    const inBuffer = new InBuffer(data);           
    const tokenizer = new Tokenizer(inBuffer);      
    let aToken: AToken;
    inBuffer.cutFirstLine();

    while (inBuffer.inputRemains()) {

        do {

            aToken = tokenizer.getToken();
            console.log(aToken.getDescription());

        } while (!(aToken instanceof TEmpty) && !(aToken instanceof TInvalid));

        inBuffer.cutFirstLine();
    }
}
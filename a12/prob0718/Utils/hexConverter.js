const hexTable = "0123456789ABCDEF"

export default function hexToDec(hex) {
    let currentDigit = 0;
    let result = 0;

    for (let power = 0; power < hex.length; power++){
        let uppercase = (hex[ (hex.length - 1) - power ]).toUpperCase();
        currentDigit = Number(hexTable.indexOf(uppercase));
        result += currentDigit * (16 ** power);
    }

    return result;

}
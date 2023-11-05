The first implemenation was based on a table that the transitions only occurs on letters and digits by checking if the current character is alpha, returning true, if not, false. The problem arrives with: with this solution, any other character that is not an alpha, like "%","&" etc, would be considered as a digit. To solve this, we need to add a new transition for the 'OTHER' ones:

before:   (*check ***FSMmodel_before.png*** to see the FSM diagram of this implementation*)

    ´
    // STATES = ROWS
    const A = 0;
    const B = 1;
    const C = 2;

    // ALPHABET = COLUMNS
    const LETTER = 0;
    const DIGIT = 1;

    // State transition table
    const FSM = [
        [ B, C ],    // State B has transition to B, if the char is a letter, and to C if it's a digit;
        [ B, B ],    // State B has transition to B, if the char is a letter, and to C if it's a digit ;  
        [ C, C, ]    // State C has transition to C, if the char is a letter, and to C if it's a digit ;
    ];

    function isAlpha(c) {
        let lowerc = c.toLowerCase();
        return (lowerc >= 'a' && lowerc <= 'z');
    }
    ´

after:   (*check ***FSMmodel_after.png*** to see the FSM diagram of this implementation*)

    ´
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
        [ B, C, C ],    // State B has transition to B, if the char is a letter, to C if it's a digit, and to C if it's another char;
        [ B, B, C ],    // State B has transition to B, if the char is a letter, to B if it's a digit, and to C if it's another char;
        [ C, C, C ]     // State C has transition to C, if the char is a letter, to C if it's a digit, and to C if it's another char;
    ];

    function isValid(c) {
        let lowerC = c.toLowerCase();
        if (lowerC >= 'a' && lowerC <= 'z') return LETTER;
        if (lowerC >= '0' && lowerC <= '9') return DIGIT;
        return OTHER;
    }
    ´

The first implemenation was based on a table that transitions only by letters and digits by checking if the current character is alpha, then returning true, if not, false. The problem arrives with: with this solution, any other character that is not an alpha, like "%","&" etc, would be considered as a digit. To solve this, we need to add a new transition for the 'OTHER' ones:

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
        [ B, C ],
        [ B, B ],
        [ C, C, ]
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
        [ B, C, C ],
        [ B, B, C ],
        [ C, C, C ]
    ];

    function isValid(c) {
        let lowerC = c.toLowerCase();
        if (lowerC >= 'a' && lowerC <= 'z') return LETTER;
        if (lowerC >= '0' && lowerC <= '9') return DIGIT;
        return OTHER;
    }
    ´
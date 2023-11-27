#include <stdio.h>

char myChar;

char toLower(char ch){
    if( (ch >= 'a') && (ch <= 'z') ) {
        return ch;
    }
    return ch + 32;
};


int main() {
    printf("write a character in upper case: ");
    scanf("%c", &myChar);
    printf("your char in LowerCase: %c", toLower(myChar));
    return 0;
}
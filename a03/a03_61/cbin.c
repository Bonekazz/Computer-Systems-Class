#include <stdio.h>
#include <math.h>

int binToDecSigned(const int bin[]){
	signed int result = 0;
	int msb = bin[0];
		
	if(msb == 0){
		for(int i = 7; i >= 1; i--){
			if(bin[i] == 0) {
				continue;
			}
			result += pow(2, (7 - i));
		}
		return result;			
	}
	//negate and add 1
	int newBin[8] = {0};

	//negation
	for(int i = 0; i < 8; i++){
		newBin[i] = bin[i] == 0 ? 1 : 0;
	}
	//converting to decimal
	for(int i = 7; i >= 1; i--){
		if(newBin[i] == 0) {
				continue;
		}
		result += pow(2, (7 - i));
	}
	result = 0 - (result + 1);
	return result;
}

int main() {
	int binNum[8] = {0};
	
	//scan the binary
	printf("enter your binary number: ");
	for(int i = 0; i < 8; i++){
		scanf("%d", &binNum[i]);
	}
	for(int i = 0; i < 8; i++){
		printf("%d", binNum[i]);
	}
	printf(" (bin) = ");
	printf("%d (dec);", binToDecSigned(binNum));	
        printf("\n");
   	
	return 0;
}


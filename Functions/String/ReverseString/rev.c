// Online C compiler to run C program online
#include <stdio.h>
#include <stdlib.h>


int main() {
    char *str;
    str = malloc(255);
    char *cc;
    cc = malloc(255);
    printf("Geef een string: ");
    fgets(str, 255, stdin);
    
    
   
    int tel = 0;
    while((int)(*(str+ tel)) != 10){
        tel++;
    }
    
    for(int i = tel - 1, j = 0; i >= 0; i--, j++){
        cc[j] = str[i];
    }
    
    
    printf("Val: %d\n", tel);
    printf("Uw cc string is: %s\n",cc);
    
    return 0;
}

// Online C compiler to run C program online
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void getUsers(char **names, int n, int len){
    for(int i = 0; i < n; i++){
        names[i] =malloc(len * sizeof(char));
    }
    
    for(int i = 0; i < n; i++){
        char *name = malloc(len * sizeof(char));
        printf("Geef een naam: ");
        scanf("%s", name);
        strcpy(names[i], name);
        free(name);
        //printf("Ingevoerde naam is: %s\n", names[i]);
    }
}

void getkWh(int *kwh, int n){
    for(int i = 0; i < n; i++){
        int val;
        printf("Hoeveel kWh: ");
        scanf("%d", &val);
        *(kwh + i) = val;
    }
    
}
void price (char **names, int *kwh, int n){
    for(int i = 0; i < n; i++){
        int pay = 2000;
        if(*(kwh + i) > 1000){
            pay += *(kwh + i) - 1000;
        }
        printf("%s moet %d pennies betalen\n", names[i], pay);
    }
}

int main() {
    int n = 1;
    int len = 64;
    printf("Hoeveel users: %d\n",n);
    /*
    //printf("Hoeveel users: ");
    //scanf("%d", &n);
    */
    
    char **names = malloc(n * sizeof(char*));
    int *kwh = malloc(n * sizeof(int));

    getUsers(names, n, len);
    getkWh(kwh, n);
    price(names, kwh, n);
    
    
    for(int i = 0; i < n; i++){
        free(names[i]);
    }
    free(names);
    free(kwh);
    
    return 0;
}

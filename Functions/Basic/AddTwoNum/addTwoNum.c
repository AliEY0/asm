#include <stdio.h>

int add(int a, int b){
    return a + b;
}


int main() {
   
    int a, b, som;
    printf("Geef waarde van a: ");
    scanf("%d",&a);
    printf("Geef waarde van b: ");
    scanf("%d",&b);
    
    som = add(a, b);
    printf("%d + %d = %d\n", a, b, som);
    return 0;
}

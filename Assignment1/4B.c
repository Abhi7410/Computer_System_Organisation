#include <stdio.h>

void count(char *a, int *ch);


int main()
{
     char a[33];
     int ch[26]={0};
     for (int i = 0; i < 33; i++)
     {
        scanf("%c",&a[i]);
     }
     
    char b[27]="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    count(a,ch);
    for (int i = 0; i < 26; i++)
    {
      printf(" (%c) ---> %d \n",b[i],ch[i]);
    }
   
    

    return 0;
}

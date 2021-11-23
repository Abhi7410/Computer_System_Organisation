#include <stdio.h>
void clockwise(short int *a);
// {

//     for (int i = 0; i < 4; i++) {
//         for (int j = i; j < 7 - i ; j++) {

//             // Swap elements of each cycle
//             // in clockwise direction
//             int temp = a[i][j];
//             a[i][j] = a[7 - j][i];
//             a[7- j][i] = a[7- i][7- j];
//             a[7- i][7 - j] = a[j][7- i];
//             a[j][7 - i] = temp;
//         }
//     }
// }
int main()
{
    short int arr[8][8];
    for (short int i = 0; i < 8; i++)
    {
        for (short int j = 0; j < 8; j++)
        {
            scanf("%hd", &arr[i][j]);
        }
    }
      printf("\n");


    clockwise(&arr[0][0]);
    for (short int i = 0; i < 8; i++)
    {
        for (short int j = 0; j < 8; j++)
        {
            printf("%hd ", arr[i][j]);
        }
        printf("\n");
    }
}
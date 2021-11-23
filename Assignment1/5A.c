#include<stdio.h>
 
// Function to calculate hamming distance
short int hammingDistance(short int n1, short int n2);
// {
//     int x = n1 ^ n2;
//     int setBits = 0;
 
//     while (x > 0) {
//         setBits += x & 1;
//         x >>= 1;
//     }
 
//     return setBits;
// }
 
// Driver code
int main()
{
    short int n1,n2;
    scanf("%hd",&n1);
    scanf("%hd",&n2);
    short int ans = hammingDistance(n1,n2);
    printf("%hd\n",ans);
 
    return 0;
}
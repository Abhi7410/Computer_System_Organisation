.data
n:
.long 32
arr:
 .word 28,19,17,16,15,14,9,8,8,7,5,5,3,3,3,2,2,1,0,-1,-2,-4,-4,-7,-6,-8,-8,-15,-16,-20,-17,-32
              
 .text
 .global main

 main:
     mov n@GOTPCREL(%rip) , %rsi
     mov (%rsi),%esi
     mov arr@GOTPCREL(%rip), %rdi
   
     movq $0,%r9   #i=0
     subq $1,%rsi   #n = n-1 because from 0 to n-1 we will bring
     movq $1,%r8   #j=1
     jmp .sort
     
     .sort:
         leaq (%rdi,%r9,2),%r10  #address of r10
         movw (%r10),%r10w       #value at first ith position
         leaq (%rdi,%r8,2),%r11  #2address at jth position
         movw (%r11),%r11w       #value at jth position
         cmpw %r10w,%r11w        #a[i],a[j]
         jge .noswap             #if a[j]>a[i] no problem
         jl .swap                #if a[i]>a[j] then we swap
         
     .swap:
         leaq (%rdi,%r9,2),%rax       #swap
         leaq (%rdi,%r8,2),%rdx
         movw %r11w,(%rax)
         movw %r10w,(%rdx) 
         addq $1,%r8  
         cmpq %r8,%rsi        #after swapping done we want to match a[i] with a[j+1] but before we check if j is not equal to n-1
         jl .iinc             #n-1 < j
        
         jmp .sort
    
    .noswap:              #no need of swaps incremnt j if it is last then we increment 
         addq $1,%r8      
         cmpq %r8,%rsi
         jge .sort
         je .iinc

     .iinc:
         addq $1,%r9       #if j reaches the last then we increment i 
         movq %r9,%r13     #for making j = i+ 1
         addq $1,%r13
         movq %r13,%r8
         cmpq %r9,%rsi
         jg .sort
         je .End

     .End:
     ret


       

        
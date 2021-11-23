.data
n:
.long 8
arr:
 .word 1,2,3,4,5,6,7,8
x:                
 .long 9              #searching value
 .text
 .global main

 main:
     mov n@GOTPCREL(%rip) , %rsi
     movl (%rsi),%esi
     mov arr@GOTPCREL(%rip), %rdi
     #movl (%r10),%r10d
     mov x@GOTPCREL(%rip), %rcx
     movl (%rcx),%ecx
     movq $0,%r11   #storing the index
     subl $1,%esi   #n = n-1
     movq $0,%r8    #i = 0
     movq $0,%r12     #storing the no. of iterations
     jmp .search
     
 

.search:
     lea (%rdi,%r8,2),%rbx           #going in the array storing the first position
     movw (%rbx),%bx                 #storing the first valye
     movq %r8,%r11                   #storing the value of iterator to return as index
     addq $1,%r12
     cmpw  %bx,%cx                 #comparing if the value to search matches with the array idex
     je .done                          #if equal we return index 
     
     addq $1,%r8                     #else we i = i+1
     jmp .L6                           #go to L6 to check if the index is greater than n or not

.L6:
     cmpq %r8,%rsi
     jg .search                       #if it is lower than we go in the loop

.L4:
    movq $-1,%r11                    #if it doesn't match with anyone is stores -1 in the index
    movq %rsi,%r12
    addq $1,%r12
.done:
    ret






 






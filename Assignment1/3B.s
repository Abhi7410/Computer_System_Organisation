.text
.global clockwise

#rdi-->arr[0][0]

clockwise:
        movq $8,%r8             #n=8
        subq $1,%r8             #n=7
        movq $8,%r9              
        movq $0,%r10            #i=0
        movq $0,%r11            #j=0
        movq $4,%r12
        jmp .L1

 .L2:
        subq %r10,%r8          # r8 = 7-i  max for inner loop
        movq %r10,%r11         #  starting point for inner loop ,equating both j = i when this happens we go for the loop
        jmp .L4

  .L3:
        movq %r10,%rdx                 #rdx = i    
        imulq $8,%rdx                  #rdx = 8*i
        addq %r11,%rdx                 #rdx = 8*i + j index for matrix
 
        leaq (%rdi,%rdx,2),%rcx        #array acces the element A[2*(8i+j)] from the first element
        movw (%rcx),%bx                #bx(temp)= A[i][j]


        movq $7,%r9                  #r9= 7 or n-1            
        subq %r11,%r9               # r9 = n-1-j or 7-j
        movq %r9,%rdx               #rdx = 7-j
        imulq $8,%rdx               #8(7-j)
        addq %r10,%rdx              #8(7-j) + i
        leaq (%rdi,%rdx,2),%rsi    #access the element
        movw (%rsi),%r14w           
        movw %r14w,(%rcx)        #storing as previousA[i][j] = A[7-j][i]
                                 #for now we have stored two elemtnsts which has to be swapped

        movq $7,%r9              #n = 7 
        movq %r9,%r15            #r15 = r9
        subq %r10,%r15           #r15 = 7 - i
        subq %r11,%r9            #r9=7-j
        movq %r15,%rdx           #storing row 
        imulq $8,%rdx            #8*row
        addq %r9,%rdx            #8*row + column
        leaq (%rdi,%rdx,2),%rcx  #on the previous address we access the array alement on rcx
        movw (%rcx),%r14w
        movw %r14w,(%rsi)         #A[7-j][i] = A[7-i][j]

        movq $7,%r9                 
        subq %r10,%r9
        movq %r11,%rdx
        imulq $8,%rdx
        addq %r9,%rdx
        leaq (%rdi,%rdx,2),%rsi
        movw (%rsi),%r14w
        movw %r14w,(%rcx)         #A[7-i][7-j]=A[j][7-i]
        movw %bx,(%rsi)          #A[j][7-i] = bx(temp)
        addq $1,%r11         #j++

  .L4:
        cmp %r11,%r8          # cmparing j and 7-i
        jg .L3                
        inc %r10              #i++
  
.L1:
#
       cmp %r10,%r12         #acc to first loop compring i < 4
       jg .L2
       rep;ret




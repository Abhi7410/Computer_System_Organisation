.text
.global count


# %rdi=chararray[32],%rsi = givenarray[26]

count:

.L3:
    movq $0,%r8                          # i = 0
    jmp .L5 

.L4:
 
   leaq   (%rdi,%r8,1),%r12               #storing the first char value in r12
   addq    $1,%r8                          #i = i + 1
   mov    (%r12),%r11                      #temp = *char[0]
                   
   and     $255,%r11                        #as it is character converting in int
   subq    $65,%r11                        # char[i]=char[i]-65
   cmpq    $25,%r11                     #cmpring to check if it is not a capital letter
   jg      .L5
   cmpq    $0,%r11
   jl      .L5
   addl $1,(%rsi,%r11,4)                #going in the count array

       
               
.L5:
   cmpq $33,%r8                         #if j < 33 then we go ahead
   jl .L4
   rep; ret                             #return




.text
.global hammingDistance

#rdi-->n1,rsi---<n2
hammingDistance:
  xorw %di,%si     #xor in n1 ,n2
  movw %si,%dx
  movw $0,%bx     
  movw $0,%ax     #setbits=0
  jmp .L3
  
.L2:
  movw %dx,%cx
  andw	$1, %cx
  addw %cx,%ax
  sarw  $1,%dx
  addw  $1,%bx

.L3:
   cmpw $16,%bx
	 jl .L2
	 rep;ret
 


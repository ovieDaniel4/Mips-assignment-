.data
msg:.asciiz "enter a:"
msg1:.asciiz "enter b:"
msg2:.asciiz "enter c:"
msg3:.asciiz "complex_root"
msg4:.float 4.0
msg5:.float 2.0
msg6:.asciiz"\nAnd\n"
msg7:.asciiz"\nHave a nice day\n"
.text
main:
li $v0,4
la $a0,msg
syscall
li $v0,6  #input a=$f0
syscall
mov.s $f1,$f0    # a=$f1

li $v0,4
la $a0,msg1
syscall
li $v0,6 
syscall
mov.s $f2,$f0   # b=$f2

li $v0,4
la $a0,msg2
syscall
li $v0,6
syscall
mov.s $f3,$f0     # c=$f3

lwc1 $f4,msg4  # float 4.0
lwc1 $f5,msg5  #float 2.0
#solving for d
mul.s $f6, $f2,$f2    # b^2 =$f6
mul.s  $f7,$f1,$f3   # a*c =$f7
mul.s $f7,$f7,$f4     #4*ac =$f8
sub.s $f9,$f6,$f7    #$f9 =d
mfc1 $t0,$f9
#li $t1,0
blez $t0,complex_root


neg.s $f10,$f2     # $f10= -b
sqrt.s $f15,$f9     # $f15=squarerootof d
mul.s $f16,$f5,$f1   # $f16= 2*a

add.s $f17, $f10,$f15   # -b + sqrt d

div.s $f17,$f17,$f16     # $f17 -b+sqrtd/2*a
mov.s $f12,$f17
li $v0,2
syscall

la $a0,msg6
li $v0,4
syscall

sub.s $f18,$f10,$f15    #-b-sqrtd

div.s $f18, $f18,$f16   # $f18=-b-sqrtd/2*a

mov.s $f12,$f18
li $v0,2
syscall
la $a0,msg7
li $v0,4
syscall

b exit

complex_root:
la $a0,msg3
li $v0,4
syscall

exit:
li $v0,10
syscall

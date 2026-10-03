.globl main
.data
SUM: .word 0
AVG: .float 0.0
ask_n: .asciz "Enter number of elements n: "
ask_num: .asciz "Enter integer element: "
result: .asciz "Hi my name is e966c1 and the average is: "

.text
main:
	li a7, 51
	la a0, ask_n
	ecall
	
	# n
	mv s0, a0
	# counter
	li s1, 0
	# sum
	li s2, 0

inputloop:
	bge s1, s0, avg
	
	li a7, 4
	la a0, ask_num
	ecall
	
	li a7, 5
	ecall
	
	add s2, s2, a0
	addi s1, s1, 1
	j inputloop
	
avg:
	la s3, SUM
	sw s2, 0(s3)

	fcvt.s.w f0, s2
	fcvt.s.w f1, s0
	fdiv.s f2, f0, f1

	la s3, AVG
	fsw f2, 0(s3)
	
	li a7, 60
	la a0, result
	fmv.s fa1, f2
	ecall
	
	li a7, 10
	ecall
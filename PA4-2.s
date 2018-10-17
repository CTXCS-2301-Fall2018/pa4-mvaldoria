	@ Factorial
	@ Marc Valdoria
	@ PA4-2
	@ 10/22/18

	.extern printf
	.extern scanf
	.global main
	.func main
main:	PUSH	{LR}
	LDR	R0, =prompt	@ Get address of prompt
	BL	printf		@ Print prompt to screen
	LDR	R0, =in		@ Get addr of input format string
	LDR	R1, =n		@ Get addr of n
	BL	scanf		@ Put value in n using scanf
	LDR	R0, =n		@ Addr of n into R0
	LDR	R0, [R0]	@ n is now in R0
	@-------------
	@ Your code goes here.  Put n! in R2
	@-------------

	MOV R2, #1 @ Move #1 into R2 as a default value.

_loop:
    CMP R0, #1       @ Compare R0 to #1.
    MULGT R2, R0, R2 @ Multply (R0 * x)if R0 is greater than #1 and store into R1.
    SUBGT R0, R0, #1 @ Substract (R0 - #1) if R0 is greater than #1 and store into R1.
    BGT _loop        @ Loop if R0 is greater than #1.


	@-------------
	@ Do NOT alter code past this line.
	@-------------
	MOV	R1, R2
	LDR	R0, =out
	BL 	printf
	POP	{PC}

.data
n:	.word 0
prompt:	.asciz "Enter n: "
in:	.asciz "%d"
out:	.asciz "factorial is: %d\n"


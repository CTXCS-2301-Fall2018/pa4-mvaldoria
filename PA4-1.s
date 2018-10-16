
	@	Marc Valdoria
	@   PA4-1
	@   10/22/18


	.extern printf
	.extern scanf
	.global main
	.func main
main:
	PUSH	{LR}
	LDR	R2, =startval 	@ get addr of startval
	LDR	R2, [R2]	@ Load startval -> R2
	LDR	R3, =endval	@ get addr of endval
	LDR	R3, [R3]	@ Load endval -> R3
	@-------------
	@ Your code begins here
	@ Your code must put the final answer
	@ in R1.
	@-------------

    MOV R4, #0 @Store #0 into R4 as a counter --> x = 0
    MOV R1, #0 @Store #0 into R1 as sum --> initialSum = 0

_loop:
    ADD R4, R4, #1  @ Add R4 + #1 --> update counter and store into R4
    ADD R1, R4, R1  @ Add R4 + R1 and store to R1. --> sum = x + initialSum,
                    @ then once it loops it becomes sum = x + sum.
    CMP R4, R3      @ Compare R4 to R3.
    BNE _loop       @ Loop if R4 not equal to R3 --> if(x != 5) then loop, else stop.



	@-------------
	@ Do NOT alter code past this line.
	@-------------
	LDR	R0, =out
	BL	printf
	POP	{PC}

.data
startval:	.word 1
endval:		.word 5
out:		.asciz "%d\n"

.syntax unified
.cpu cortex-m3
.fpu softvfp
.thumb

.section .text
.global main

main:
	MOV R0, 0x20000000	// posição inicial do vetor em R0
	MOV R1, #10			// número de posições do vetor em R1
	MOV R2, #2			// Valor a ser armazenado no vetor em R2

 	CMP R1, #0			// checa se nmr de elementos é igual a 0
 	BEQ end				// finaliza se for igual a 0

init_vector:
	STR R2, [R0], #4	// armazena na posição R0 o valor contido em R2, com offset de 4(bytes)
	SUBS R1, R1, #1		// decrementa R1
	BNE init_vector		// se R1 != 0, volta para o começo do loop

end:
	BX LR

loop:
	B loop

 .end

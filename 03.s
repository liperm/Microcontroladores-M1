.syntax unified
.cpu cortex-m3
.fpu softvfp
.thumb

.section .data
    // Inicializa um vetor de inteiros com valores fixos
    origin: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  // Vetor com 10 valores
	destination: .space 40 // aloca memóra para as 10 posições (10 * 4)

.section .text
.global main


main:
	LDR R0, =origin			// endereço inicial do vetor de origem em R0
	LDR R1, =destination	// endereço incial do vetor destino em R1
	MOV R2, #10				// tamanho do vetor em R2

	CMP R2, #0
	BEQ end					// finaliza se o tamanho for 0

	copy_vector:
		LDR R3, [R0], #4	// carrega R3 com o valor d
		STR	R3, [R1], #4	// Armazena R3 na posição R1
		SUBS R2, R2, #1		// Decrementa o contador
		BNE copy_vector		// refaz o loop caso ainda haja valores

end:
	BX LR

loop:
	B loop

 .end

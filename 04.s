.syntax unified
.cpu cortex-m3
.fpu softvfp
.thumb

.section .data
    // Inicializa um vetor de inteiros com valores fixos
    vector: .word 1, 2, 3, 4, 10, 6, 7, 8, 9, 10  // Vetor com 10 valores

.section .text
.global main


main:
	LDR R0, =vector			// endereço inicial do vetor em R0
	MOV R1, #10				// tamanho do vetor em R1

	CMP R1, #0
	BEQ end					// finaliza se o tamanho for 0

	MOV R3, #0				// R3 guardará o maior valor encontrado até o momento
	find_greater:
		LDR R2, [R0], #4	// carrega R2 com o valor do array
		CMP R2, R3			// compara o valor atual (R2) com o maior atual (R3)
		BLT lesser			// caso seja menor, pula para o próximo valor
		MOV R3, R2			// caso não seja, substitui o maior atual (R3)

	lesser:
		SUBS R1, R1, #1		// Decrementa o contador
		BNE find_greater	// refaz o loop caso ainda haja valores

	MOV R0, R3				// Move o atual para R0

end:
	BX LR

loop:
	B loop

 .end

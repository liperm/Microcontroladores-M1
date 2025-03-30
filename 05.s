.syntax unified
.cpu cortex-m3
.fpu softvfp
.thumb

.section .data
    // Inicializa um vetor de inteiros com valores fixos
    vector: .word 10, 9, 8, 7  // Vetor com 10 valores

.section .text
.global main


main:
	LDR R0, =vector			// endereço inicial do vetor em R0
	MOV R1, #4				// tamanho do vetor em R1
	MOV R7, #0				// Número de trocas em r7

	SUBS R1, R1, #1
	BEQ end					// finaliza se o tamanho for 0

external:
	MOV R3, R1				// R3 com o número de comparações restantes
	MOV R4, R0				// R4 com o valor inicial do vetor

internal:
	LDR R5, [R4]		// elemento atual em R5
	LDR R6, [R4, #4] 	// proximo elemento em R6

	CMP R5, R6			// compara atual (R5) e próximo (R6)
	BLE dont_swap

	// Realiza swap
	STR R6, [R4]
	STR R5, [R4, #4]
	ADD R7, R7, #1		// Incrementa contador de trocas

dont_swap:
	ADD R4, R4, #4      // Avança para o próximo elemento
    SUBS R3, R3, #1     // Decrementa contador interno
    BNE internal     	// Repete enquanto houver comparações

    SUBS R1, R1, #1     // Decrementa contador externo
    BNE external     	// Repete o loop externo

	MOV R0, R7			// move o total de trocas para o R0

end:
	BX LR

loop:
	B loop

 .end

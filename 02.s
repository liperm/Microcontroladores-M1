.syntax unified
.cpu cortex-m3
.fpu softvfp
.thumb

.section .data
    // Inicializa um vetor de inteiros com valores fixos
    vetor: .word 1, 2, 3, 4, 5, 2, 4, 5, 3, 2  // Vetor com 10 valores


.section .text
.global main


main:
	LDR R0, =vetor		// endereço inicial do vetor em R0
	MOV R1, #10			// tamanho do vetor em R1
	MOV R2, #2			// valor a ser procurado em R2
	MOV R5, #0			// Limpa o valore de R5, que guardará o numero de ocorrencias

	count_ocurrances:

		LDR R3, [R0], #4	// R3 com o valor atual do vetor
		SUBS R4, R3, R2		// R4 com a subtração dos valores
		BNE continue_loop	// Caso o valor atual (R3) e o valor desejado (R2) não forem iguais, continua o loop
		ADD R5, R5, #1		// Caso sejam, soma as ocorrencias (R5)

	continue_loop:
		SUBS R1, R1, #1
		BNE count_ocurrances

	MOV R0, R5

end:
	BX LR

loop:
	B loop

 .end

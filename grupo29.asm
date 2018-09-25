;*****************************************************************************************************************;
; #/////////////////////////////////////////////////////////////////////////////////////////////////////////////# ;												
; #																												# ;
; #																												# ;		
; #											Projeto_IAC_2017-2018												# ;
; #																												# ;
; #												  Grupo nº 29													# ;
; #																												# ;
; #										 Rafael Galhoz     	 nº 90769											# ;
; #										 Afonso Vasconcelos  nº 90698											# ;
; #										 João Ribeiro        nº 89913											# ;
; #																												# ;
; #																												# ;
; #\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\# ;
;******************************************************************************************************************

;******************************************************************************************************************
;
;													Constantes										
;
;******************************************************************************************************************

DISPLAYS 			EQU 	0A000H; 		Endereço dos displays
LINHA 				EQU 	0C000H; 		Endereço das linhas do Displays
COLUNA 				EQU 	0E000H; 		Endereço das colunas do Displays
ECRA 				EQU 	8000H;			Endereço do ecrã
ultima_linha		EQU 	0008H;			Número da ultima linha do teclado
No_tecla 			EQU 	00FFH;			Valor que o teclado regista quando não é clicada nenhuma tecla
Reseta				EQU 	0000H;			Valor 0 para resetar qualquer coisa
BTS_ECRA 			EQU 	128;			Quantidade de bytes do ecrã
Flag_1				EQU		1;				Valor para colocar flags a 1 na memoria
Flag_0 				EQU		0;				Valor para colocar flags a 0 na memoria
ciclo				EQU 	3;				Numero de ciclos do fim de jogo
TRES 				EQU 	3;				Numero 3
max_2_digitos 		EQU 	99H;			Numero maximo para um valor no display

Isola_bits_tecla	EQU		0FH;			Mascara para isolar a tecla carregada

prox_ninja			EQU		1;				Valor usado para mudar de ninja
qntd_ninjas 		EQU 	4;				Quantidade de ninjas
largura_ninja 		EQU 	3;				Largura de um ninja
altura_ninja 		EQU 	4;				Altura de um ninja  			
linha_inicial		EQU		16;				Linha inicial de um ninja
Dois_bits 			EQU 	2H;				VAlor para dar shift de 2 bits
ninja_0 			EQU		0;				Numero do ninja 0
ninja_1 			EQU		1;				Numero do ninja 1
ninja_2 			EQU 	2;				Numero do ninja 2
ninja_3 			EQU		3;				Numero do ninja 3
elementos_ninja		EQU 	11;				NUmero de elementos de um ninja
coluna_desce_ninja	EQU 	4;				NUmero que se tem de somar a uma tecla que sobe um ninja para descer este

Posicao_alta		EQU		3;				Maximo da altura do 1ºelemento do ninja
fim_pixelscreen		EQU		31;				Minimo da altura do 1ºelemento do ninja

Ult_tecla_ninja 	EQU		07H;			Ultima tecla capaz de mexer um ninja
Tecla_comeca		EQU		0CH;			Tecla que começa o jogo
Tecla_pausa			EQU		0DH;			Tecla que pausa o jogo
Tecla_continua		EQU		0DH;			Tecla que continua o jogo
Tecla_termina		EQU		0EH;			Tecla que termina o jogo

num_diversos		EQU 	3;				Quantidade dos diversos
Diverso_num_0		EQU 	0;				primeiro diverso
mais_um				EQU		1;				Valor 1
prox_diverso		EQU 	1;				Valor usado para mudar para o prox diverso
Diversos_altura 	EQU		3;				Altura das armas e dos presentes
Diversos_largura 	EQU 	3;				Largura das armas e dos presentes
Diversos_largura0	EQU 	2;	
Diversos_elem		EQU 	8;				Quantidade de elementos dos diversos (de 0 a 8)
Diversos_coluna_ini	EQU 	31;				Coluna inicial do primeiro elemento dos diversos
Flag_presente		EQU 	0;				Flag que indica que um diverso é presente
Flag_arma			EQU 	1;				Flag que indica que um diverso é arma

Mascara_num_0a7		EQU 	00000111b;		Mascara para limitar um numero de 0 a 7
Mascara_num_0a3 	EQU 	00000011b;		Mascara para limitar um numero de 0 a 2

;*****************************************************************************************************************
;
;													Tabelas							
;
;*****************************************************************************************************************

PLACE 	2500H

pilha_SP:      		TABLE 	100H;			Espaço reservado para a pilha 
fim_pilha_SP:		

ecra_fim_jogo:		TABLE	4H;				Tabela com o ecrã final
					WORD	0FFFFH
					WORD	0FFFFH
					TABLE	8H

					WORD 	03E1CH
					WORD	417EH
					WORD	6336H
					WORD	6360H
					WORD	6063H
					WORD	7760H
					WORD    6763H
					WORD	7F7CH
					WORD	637FH
					WORD	6B60H
					WORD	6363H
					WORD	6360H
					WORD	3E63H
					WORD	637EH
					
					TABLE 	8H

					WORD	3E63H
					WORD	7EFCH
					WORD	6363H
					WORD	60C6H
					WORD	6363H
					WORD	60C6H
					WORD	6363H
					WORD	7CFCH
					WORD	6363H
					WORD	60D8H
					WORD    6336H
					WORD	60CCH
					WORD	3E1CH
					WORD	7EC6H

					TABLE	8H
					WORD	0FFFFH
					WORD	0FFFFH
					TABLE	4H 

ecra_vitoria:		TABLE 	6H;				Tabela com um dos ecrãs de vitoria
					
					WORD 	0FFFFH
					WORD 	0FFFFH

					TABLE 	8H

					WORD 	0663H
					WORD 	0C620H
					WORD 	0666H
					WORD 	6620H
					WORD 	0666H
					WORD	6620H
					WORD	03C6H
					WORD 	6620H
					WORD 	0186H
					WORD 	6620H
					WORD 	0187H
					WORD 	6760H
					WORD 	0183H
					WORD 	0C3C0H

					TABLE 	4H

					WORD 	0991H
					WORD 	0E390H
					WORD 	0993H
					WORD 	3390H
					WORD 	0993H
					WORD 	33D0H
					WORD 	0993H
					WORD 	33F0H
					WORD 	0DB3H
					WORD 	3370H	
					WORD 	07E3H
					WORD 	3330H
					WORD 	0661H
					WORD 	0E310H

					TABLE 	8H

					WORD 	0FFFFH
					WORD 	0FFFFH

					TABLE 	6H

trofeu:				TABLE 	8H;			Tabela com um dos ecrãs de vitoria

					WORD	001FH
					WORD	0F800H
					WORD 	00FFH
					WORD 	0FF00H
					WORD 	009FH
					WORD 	0F900H
					WORD	009EH
					WORD	7900H
					WORD	00DCH
					WORD	7B00H
					WORD	005CH
					WORD	7A00H
					WORD	007EH
					WORD	7E00H
					WORD	001EH
					WORD	7800H
					WORD	001EH
					WORD	7800H
					WORD	000EH
					WORD	7000H
					WORD	000EH
					WORD	7000H
					WORD	000EH
					WORD	7000H
					WORD	0007H
					WORD	0E000H
					WORD	0007H
					WORD	0E000H
					WORD	0003H
					WORD	0C000H
					WORD	0001H
					WORD	8000H
					WORD	0001H
					WORD	8000H
					WORD	0001H
					WORD	8000H
					WORD	0001H
					WORD	8000H
					WORD	0001H
					WORD	8000H
					WORD	0001H
					WORD	8000H
					WORD	0003H
					WORD	0C000H
					WORD	0007H
					WORD	0E000H
					WORD	000FH
					WORD	0F000H

					TABLE 	8H

Press_c_start:		TABLE 	0AH;		Tabela com o ecrã inicial
					WORD 	0EEEH
					WORD 	0EE70H
					WORD 	0AA8H
					WORD 	08840H
					WORD	0ECEH
					WORD	0EE40H
					WORD 	08A8H
					WORD 	2240H
					WORD 	08AEH
					WORD 	0EE70H

					TABLE 	6H
					WORD 	000EH
					WORD 	0E000H
					WORD 	0004H
					WORD 	0A000H
					WORD 	0004H
					WORD 	0A000H
					WORD 	0004H
					WORD 	0A000H
					WORD 	0004H
					WORD 	0E000H

					TABLE 	6H
					WORD 	01DDH
					WORD 	0DDC0H
					WORD 	0109H
					WORD 	5480H
					WORD 	01C9H
					WORD 	0D880H
					WORD 	0049H
					WORD 	5480H
					WORD 	01C9H
					WORD 	5480H

					TABLE 	0CH

Reseta_ecra:		TABLE 	40H;		Tabela com 64 words vazias

Interrupcoes:		WORD 	Interrupcao_0;	interrupção 0
					WORD	Interrupcao_1;	interrupção 1

Mascaras_pixel_1: 	STRING	80h,40h,20h,10h,08h,04h,02h,01h;Mascaras para pintar pixel a 1

Ninjas_tab:			STRING 	0,1,0;		Tabela com o desenho dos ninjas
					STRING 	1,1,1
					STRING 	0,1,0
					STRING 	1,0,1

Arma:				STRING 	1,0,1;		Tabela com o desenho da arma
					STRING 	0,1,0
					STRING 	1,0,1

Presente:			STRING 	1,1,1;		Tabela com o desenho do presente
					STRING 	1,0,1
					STRING 	1,1,1

Diversos_linha_ini:	STRING	2,11,22;	Tabela com as linhas inicias dos 2 diversos

;*****************************************************************************************************************
;
;											Variaveis em memoria							
;
;*****************************************************************************************************************

numero_aleatorio:	STRING 	0H

Tecla_carregada:	STRING	0;			String com a ultima tecla carregada

Ninja_coluna:		STRING 	2,6,10,14; 	Colunas do 1º elemento do ninja 

Ninja_linha:		STRING 	16,16,16,16;linhas do 1º elemento do ninja

Tecla_nova:			STRING 	0;			Flag que indica se é a primeira vez a carregar numa tecla

colisao_presente:	STRING 	0;			Flag que indica que houve uma colisao com um presente

Flag_comeco:		STRING	1;			Flag para começar o jogo

Flag_pausa:			STRING	0;			Flag para pausar o jogo

Flag_termina:		STRING	0;			Flag para terminar o jogo

Reseta_jogo:		STRING 	0;			Flag responsavel por inicializar o ninja e os diversos

Flag_reseta_ecra:	STRING 	0;			Flag para resetar o ecra	

Ninjas_int_0:		STRING 	0;			String para baixar todos os ninjas

Flag_int_1:			STRING 	0;			String com a flag para mover os diversos para a Interrupcao_1

_99pontos:			STRING 	0;			Flag que indica quando é que o jogador ganho o jogo

Vida_dos_ninjas:	STRING 	0,0,0,0;	Tabela com as Flags das vidas dos ninjas, se estiver a 1 esta vivo

Vida_dos_diversos:	STRING  0,0,0;		Tabela com as Flags das vidas dos diversos

Flag_diversos:		STRING 	0,0,0; 		Se a flag estiver a 1 significa que é uma arma

Diversos_linha:		STRING 	2,11,22;	Tabela com as linhas dos 2 diversos 
	
Diversos_coluna:	STRING 	32,32,32;	Tabela com as Colunas dos 2 diversos

displays_decimal:	STRING	0;			Valor dos displays em decimal

displays_hexA:		STRING 	0;			Valor dos displays em hexa

PLACE 0

;*****************************************************************************************************************
;
;										Codigo
;
;*****************************************************************************************************************

inicializar:		MOV SP,fim_pilha_SP;	inicializa o Stack Pointer
					MOV BTE,Interrupcoes;	inicializa o BTE
					EI0;					Ativa Interrupcoes 0
					EI1;					Ativa interrupções 1
					EI;						Ativa interrupções

Jogo:				CALL Teclado;			Chama a rotina principal Teclado
					CALL Controlo;			Chama a rotina principal Controlo
					CALL Displays

					MOV R10,ninja_0;		Mete o numero do primeiro ninja em R10
Ciclo_ninjas:		CALL Ninjas;			Chama a rotina principal Ninjas
					ADD R10,prox_ninja;		Passa para o proximo ninja
					MOV R0,qntd_ninjas;		Mete a  quantidade de ninjas em R0
					CMP R10,R0;				E compara o numero do ninja com a quantidade deles
					JZ fim;					Quando for igual siginifica que ja tratou de todos 
					JMP Ciclo_ninjas;		Se não for igual continua o ciclo					

fim: 				CALL Diversos;			Chama a rotina principal Diversos
					
					CALL Gerador;			Chama a rotina responsavel pelo numero aleatorio
					
					JMP Jogo;				Volta a fazer o ciclo do jogo

;*****************************************************************************************************************
;
;									Rotinas Principais
;
;*****************************************************************************************************************
;*****************************************************************************************************************
;
;	Rotina:		Teclado
;	Descrição:	Rotina que le o teclado e guarda a tecla carregada em memoria, e ativa uma 
;				flag caso a tecla carregada seja uma nova
;	Inputs:
;	Outputs:
;
;*****************************************************************************************************************

Teclado:			PUSH R0;				Guarda os registos
					PUSH R1
					PUSH R2
					PUSH R3

					MOV R0,Tecla_carregada;	Mete o endereço da tecla carregada em R0
					MOVB R1,[R0]; 			Copia o valor antigo do teclado para R1
					CALL Ve_teclas;			Chama a rotina responsavel por ler o teclado

					MOVB R3,[R0];			Copia o valor novo da tecla para R3

					MOV R2,No_tecla;		Mete o valor FFH em R2
					CMP R3,R2;				Se nenhuma tecla for clicada
					JZ 	Flag_tecla_0;		Salta para colocar a flag do teclado a 0

					CMP R3,R1;				Compara a tecla com o valor antigo
					JZ  Flag_tecla_0;		Se for igual mete flag 0

Flag_tecla_1:		MOV R2,Tecla_nova;		Mete o endereço da flag do teclado em R2
					MOV R1,Flag_1;			Mete 1 em R1
					JMP Fim_teclado;		Salta para colocar a flag no endereço e sair da rotina
					
Flag_tecla_0:		MOV R2,Tecla_nova;		Mete o endereço da flag do teclado em R2
					MOV R1,Flag_0;			Mete 0 em R1
					
Fim_teclado:		MOVB [R2],R1;			Coloca a flag correspondente na flag do teclado

					POP R3
					POP R2;					Recupera os registos
					POP R1
					POP R0
					RET

;*****************************************************************************************************************
;
;	Rotina:		Controlo
;	Descrição:	Rotina que controla o jogo
;	Inputs:
;	Outputs:
;
;*****************************************************************************************************************

Controlo:			PUSH R0;				Guarda os registos
					PUSH R1
					PUSH R2

					CALL Flags_controlo

Ve_flag_comeco:		MOV R0,Flag_comeco;		Move o endereço da Flag de começo do jogo para R0
					MOVB R1,[R0];			Copia o valor que esta na flag para R1
					CMP R1,Flag_0;			e Compara-o com 0
					JZ Ve_flag_pausa;		Se for 0 passa para a proxima verificação
					MOV R1,Flag_0;			Move 0 para R1
					MOVB [R0],R1;			E desliga a flag do começo do jogo

					CALL Comeca_jogo;		Chama a rotina que trata do começo do jogo
					MOV R0,Reseta_jogo;		Mete o endereço responsavel pelas inicializações dos ninjas e dos diversos em R0
					MOV R2,Flag_1;			Mete 1 em R2
					MOVB [R0],R2;			Ativa a flag desse endereço

Ve_flag_pausa:		MOV R0,Flag_pausa;		Mete o endereço da Flag da pausa no R0
					MOVB R1,[R0];			Copia o valor que esta na flag e mete o no R1
					CMP R1,0;				Compara-o com 0
					JZ Ve_flag_termina;		E se este for 0 passa para a proxima verificação

					CALL Pausa_jogo;		Chama a rotina que pausa jogo
					MOV R1,Flag_0;			Move 0 para R1
					MOVB [R0],R1;			E desliga a flag da pausa do jogo

Ve_flag_termina:	MOV R0,Flag_termina;	Mete o endereço da flag que termina o jogo
					MOVB R1,[R0];			E copia o valor para R1
					CMP R1,0;				E compara-o com 0
					JZ Ve_flag_reseta_ecra;	Se este for 0 passa para a proxima verificação

					MOV R1,Flag_0;			Mete 0 em R1
					MOVB [R0],R1;			E desliga a flag do fim do jogo				
					CALL fim_jogo;			Chama a rotina que trata do fim do jogo

Ve_flag_reseta_ecra:MOV R0,Flag_reseta_ecra;Mete o endereço da flag que reseta o ecra em R0
					MOVB R1,[R0];			Copia o para R1
					CMP R1,0;				E compara-o com 0
					JZ Ve_se_ganha_jogo;	Se este for 0 passa para a proxima verificação

					MOV R1,Reseta_ecra;		Mete em R1 a tabela para resetar o ecra
					CALL escreve_ecra;		Chama a rotina responsavel pela escrita do ecrã
					MOV R1,Flag_0;			Mete 0 em R1
					MOVB [R0],R1;			e Desliga a flag que reseta o ecra

Ve_se_ganha_jogo:	MOV R0,_99pontos;		Ve flag que indica se se obteve 99 pontos
					MOVB R1,[R0];			Tira o valor da Flag
					CMP R1,Flag_0;			Se esta estiver a 0 sai da rotina
					JZ Fim_controlo;		

					MOV R1,Flag_0;			Mete em R1 o valor 0
					MOVB [R0],R1;			Mete esse valor na flag que diz se se obteve 99 pontos
					CALL vitoria;			E chama a rotina responsavel por mostrar um ecra de vitoria

					MOV R0,Flag_comeco;		Mete o endereço com a flag que começa o jogo em R0
					MOV R1,Flag_1;			Mete 1 em R1
					MOVB [R0],R1;			Ativa a flag que indica se o jogo deve de começar ou não

Fim_controlo:		POP R2;					Recupera registos
					POP R1
					POP R0
					RET

;*****************************************************************************************************************
;
;	Rotina:		Displays
;	Descrição:	Rotina que trata dos  displays
;	Inputs:		
;	Outputs:	
;
;*****************************************************************************************************************

Displays:			PUSH R0;				Guarda os registos
					PUSH R1
					PUSH R2
					PUSH R3
					PUSH R4
					PUSH R5

Ve_se_reseta:		MOV R0,Reseta_jogo;		Mete a o endereço com a flag para resetar o display em R0
					MOVB R1,[R0];			Tira o valor para o R1
					CMP R1,Flag_0;			compara-o com 0
					JZ Ve_se_soma;			E se esta estiver desligada salta para a proxima verificação
					MOV R4,Reseta;			Tira o que estiver em R4
					MOV R1,Reseta;			Reseta o R1
					MOV R0,displays_hexA;	Mete o endereço com o valor do dyspplay em hexa a 0
					JMP Mete_no_Display;	Salta para meter os valores no display

Ve_se_soma:			MOV R0,colisao_presente;Mete  o endereço com a flag que indica se houve colisao com um presente
					MOVB R2,[R0];			Tira o valor para R2
					CMP R2,Flag_0;			Se não tiver colididio 
					JZ Fim_display;			Salta para o fim do display
					MOV R2,Flag_0;			Mete 0 em R2
					MOVB [R0],R2;			Desliga a flag

Soma:				MOV R0,displays_hexA;	Mete em R0 o endereço com o valor do display em hexa
					MOVB R1,[R0];			Tira esse valor para R1
					ADD R1,TRES	;			E soma-lhe 3

Valor_decimal:		MOV R3,10; 				Mete 10 no R0
					MOV R2,R1; 				Copia o valor do display em H
					DIV R2,R3; 				Descrubro o equivalente as dezenas
					SHL R2,4;				e passo-o para o segundo nibble de menor valor
					MOV R4,R1; 				Copio o valor em H do display para R5
					MOD R4,R3; 				Descrubo o equivalente as unidades 
					ADD R4,R2; 				Somo as dezenas com as unidadeS e descubro o valor em decimal
					MOV R5,max_2_digitos;	Mete o valor maximo que o display pode mostrar em R5
					CMP R4,R5;				E compara o valor que deve estar no display com este
					JLT Mete_no_Display;	Enquanto que esse valor for mais baixo não o vai limitar a 99

Limitar_99:			MOV R1,_99pontos;		Mete em R1 a flag que indica que ja chegou aos 99 pontos
					MOV R3,Flag_1;			Mete 1 em R3
					MOVB R1,[R3];			E liga a Flag
										
					MOV R4,99H;				Limita o valor que aparece no display correspondente as unidades a 99
					MOV R1,63H;				Limita o valor do display em H equivalente a 99 D
Mete_no_Display:	MOV R2,DISPLAYS;		Mete o endereço do display em R2
					MOVB [R2],R4;			Mete o valor no display em decimal
					MOVB [R0],R1;			Meto o valor em hexa na memoria

Fim_display:		POP R5;					Recupera OS Registos
					POP R4
					POP R3
					POP R2
					POP R1
					POP R0
					RET

;*****************************************************************************************************************
;
;	Rotina:		Ninjas
;	Descrição:	Rotina que controla os ninjas
;	Inputs:		R10 - Ninja
;	Outputs:
;
;*****************************************************************************************************************

Ninjas:				PUSH R0;				Guarda registos
					PUSH R1
					PUSH R2
					PUSH R3
					PUSH R9
					PUSH R10
					MOV R1,Tecla_carregada;	Mete o endereço com a tecla carregada em R1
					MOVB R2,[R1];			Tira a tecla carregada para R1

Repoe_vida:			MOV R0,Reseta_jogo;;	Mete a flag que diz se o jogo vai ser resetado ou nao
					MOVB R3,[R0];			Tira a flag para R3
					CMP R3,0;				compara com 0 a flag
					JZ Vida_ninja_n;		Sai para a vida_ninja_n se não for para resetar

					MOV R0,Vida_dos_ninjas;	Mete o endereço com as vidas dos ninjas em R0
					ADD R0,R10;				Escolhe a vida do ninja escolhido
					MOV R3,Flag_1;			Mete 1 em R3
					MOVB [R0],R3;			Liga a vida do ninja escoolhido	

Repoe_pos_inicial:	CALL Ninjas_posicao_ini;Chama a rotina que coloca os ninjas na posição inicial			
					JMP Fim_ninjas;			Sai da rotina dos ninjas

Vida_ninja_n:		MOV R1,Vida_dos_ninjas;	Mete o endereço da tabela com as vidas dos ninjas
					ADD R1,R10
					MOVB R0,[R1];			Tira o valor que esta nas vidas dos ninjas
					CMP R0,Flag_0;			Compara esse valor com 0				
					JNZ Ve_se_ha_int0;		Se estiver a 0 significa que o ninja esta morto,
Apaga_1_int0:		MOV R3,Ninjas_int_0;		Mete o endereço da flag que que baixa todos os ninjas
					MOVB R0,[R3];			E copia o valor para R0
					CMP R0,Flag_0;			Se não houver interrupção sai
					JZ Vida_todos_ninjas
					SUB R0,1;				Subtrai 1 ao valor que estava na interrupção
					MOVB [R3],R0;			Volta a po-lo onde tirou
					JMP Vida_todos_ninjas

Ve_se_ha_int0:		MOV R3,Ninjas_int_0;		Mete o endereço da flag que que baixa todos os ninjas
					MOVB R0,[R3];			E copia o valor para R0
					CMP R0,Flag_0;			e compara-o com 0
					JZ Tecla_importante;	e se este for 0 passa para a proxima verificação

Subtrai_1_a_int0:	SUB R0,1;				Subtrai 1 ao valor que estava na interrupção
					MOVB [R3],R0;			Volta a po-lo onde tirou
					MOV R9 ,Flag_0;			Mete a flag que decide se o ninja baixa
					CALL Escreve_ninja;		Chama a rotina que baixa o ninja
					JMP Verifica_colisao;	Sai da rotina ninjas

Tecla_importante:	MOV R0,Tecla_nova;		Mete em R0 a flag que indica se é uma tecla nova ou não
					MOVB R3,[R0];			Tira a flag para o R3
					CMP R3,Flag_0;			compara-o com 0
					JZ Verifica_colisao;	Salta para o fim da rotina

Sobe_ninja_n:		CMP R2,R10;				Compara a tecla carregada com o numero do ninja
					JNZ Desce_ninja_n;		Se for igual siginifica que vai subir o Ninja

					MOV R9,Flag_1;			Mete a flag que sobe o ninja em R9
					CALL Escreve_ninja;		Chama a rotina responsavel por escrever o ninja
					JMP Verifica_colisao;	Sai da rotina

Desce_ninja_n:		MOV R0,R10;				Copia o numero do ninja para R0
					ADD R0,coluna_desce_ninja;Adiciona a esse numero 4 que é o equivalente a descer uma linha
					CMP R2,R0;				Compara a Tecla_carregada com esse valor 
					JNZ Verifica_colisao;	Se for igual siginifica que vai descer o Ninja

					MOV R9,Flag_0;			Mete a flag que decide se oo ninja desce
					CALL Escreve_ninja;		Chama a rotina que escreve o Ninja
					JMP Verifica_colisao;	Sai da rotina dos ninjas

Verifica_colisao:	MOV R9,Diverso_num_0;	Mete o valor do 1º diverso em R9
Ver_colisao_ciclo:	CALL Verifica_embate;	Chama a rotina que verifica se houve colisaoe entre ninja e diverso
					ADD R9,prox_diverso;	Passa para o proximo diverso
					MOV R0,num_diversos;	Mete a quantidade de diversos em R0
					CMP R9,R0;				E compara o nº do diverso com o nº de diversos
					JGE Fim_ninjas;			Se o primeiro foi maior ou igual ao segundo sai do ciclo
					JMP Ver_colisao_ciclo;	Volta a fazer o ciclo

Vida_todos_ninjas:	MOV R1,Vida_dos_ninjas;	Move o endereço da vida dos ninjas para R1
					MOV R2,qntd_ninjas;		Mete a quantidade de ninjas em R2
					ADD R2,R1;				Soma-os
Ciclo_todas_vidas:	MOVB R0,[R1];			Tira o valor da flag da vida do ninja
					CMP R0,Flag_0;			Compara com 0
					JNZ Fim_ninjas;			Se não é 0 significa que pelo menos 1 ninja esta vivo
					ADD R1,prox_ninja;		Soma 1 ao endereço das vidas dos ninjas
					CMP R2,R1;				Compara com a soma do endereço + qntd de ninjas
					JNZ Ciclo_todas_vidas;	Enquanto não for igual continua o ciclo

					MOV R0,Flag_termina;	Move a flag de fim de jogo para R0
					MOV R1,Flag_1;			Mete 1 em R1
					MOVB [R0],R1;			Liga a flag do fim de jogo

Fim_ninjas:			POP	R10;				Recupera os registos
					POP R9
					POP R3
					POP R2
					POP R1
					POP R0
					RET	

;*****************************************************************************************************************
;
;	Rotina:		Diversos
;	Descrição:	Rotina que controla as armas e os presentes
;	Inputs:		
;	Outputs:	
;
;*****************************************************************************************************************

Diversos:			PUSH R0;				Guarda os registos
					PUSH R1
					PUSH R2
					PUSH R9

Reset_diverso:		MOV R0,Reseta_jogo;		Mete o endereço da flag que reseta o jogo em R0
					MOVB R1,[R0];			Tira o valor que esta nessa flag
					CMP R1,Flag_0;			Compara o valor dessa flag com 0
					JZ Nova_arma_n;			E se for igual siginifica que não é para resetar o jogo e pos isso sai
					MOV R1,Flag_0;			Mete em R1 a flag 0
					MOVB [R0],R1;			E reseta a flag que reseta o jogo
					MOV R9,Diverso_num_0;	Mete o numero do 1º diverso em R9			
Reset_diverso_n:	MOV R0,Vida_dos_diversos;Mete o endereço das vidass diversos no R0
					ADD R0,R9;				Passa para o proximo objeto
					MOVB [R0],R1;			E também coloca a vida a 0
					ADD R9,prox_diverso;	Passa para o proximo diverso
					MOV R0,num_diversos;	Mete em R0 o numero de diversos que ha
					CMP R9,R0;				Compara o numero do diverso com o nº de diversos
					JZ Diversos_fim;		Se forem iguais sai do ciclo
					JMP Reset_diverso_n;	Se não forem volta a fazer ciclo

Nova_arma_n:		MOV R9,Diverso_num_0;	Mete o numero do primeiro diverso em R9
Nova_arma_n_ciclo:	MOV R1,Vida_dos_diversos;Mete em R1, o endereço das vidas dos diversos
					ADD R1,R9;				Escolhe o endereço com a vida do diverso
					MOVB R2,[R1];			Tira o valor das vida do diverso para R2
					CMP R2,0;				Compara esse valor com 0
					JNZ Prox_arma;			E se estiver a 0 significa que odiverso esta morto e por isso vai criar uma nova
					CALL Cria_diverso;		Chama a rotina que cria um diverso
Prox_arma:			ADD R9,prox_diverso;	Passa para o proximo diverso
					MOV R0,num_diversos;	Mete em R0 o numero de diversos 
					CMP R9,R0;				Compara o numero do diverso com o numeri de diversos
					JZ Ve_se_ha_int1;		Se for igual sai do ciclo
					JMP Nova_arma_n_ciclo;	Se não continua o ciclo

Ve_se_ha_int1:		MOV R0,Flag_0;			Mete 0 em R0
					MOV R1,Flag_int_1;		Mete o endereço da flag que mexe os diversos em R1
					MOVB R2,[R1];			Tira o valor que estava nesse endereço para R2
					CMP R2,Flag_0;			Compara esse valor com 0
					JZ Diversos_fim;		E se este for 0 siginifica que as armas não se mexem e sai da rotina
					MOVB [R1],R0;			Se estiver a 1, desliga a flag para não voltar a mexer

Diverso_n:			MOV R9,Diverso_num_0;	Mete em R9 o numero do primeiro diverso 
Diverso_n_ciclo:	CALL Escreve_diversos;	Chama a rotina que mexe e escreve os diversos
					ADD R9,prox_diverso;	Passa para o proximo diverso
					MOV R0,num_diversos;	Mete em R0 o numero de diversos
					CMP R9,R0;				Compara o numero do diverso atual com o numero de diversos 
					JZ Diversos_fim;		Se for igual salta para o fim da rotina
					JMP Diverso_n_ciclo;	Se não continua o ciclo

Diversos_fim:		POP R9;					Recupera os registos
					POP R2
					POP R1
					POP R0
					RET

;*****************************************************************************************************************
;
;	Rotina:		Gerador
;	Descrição:	Rotina que Incrementa 1 a um numero semi_aleatorio
;	Inputs:		
;	Outputs:	
;
;*****************************************************************************************************************

Gerador:			PUSH R1;				Guarda o registo

					MOV R1,numero_aleatorio;Mete em R1, o endereço que tem um numero semi aleatorio
					MOVB R0,[R1];			Tira para R0 o seu valor
					ADD R0,1;				Incrementa 1 ao numero aleatorio
					MOVB [R1],R0;			E volta a meter o numero no endereço dele

					POP R1;					Recupera os registos
					RET

;*****************************************************************************************************************
;
;								Rotinas Secundarias do teclado
;
;*****************************************************************************************************************
;*****************************************************************************************************************
;
;	Rotina:		Ve_teclas
;	Descrição:	Rotina que verifica se alguma tecla foi carregada, se foi o R0 fica com o valor
;				se nenhuma for carregada fica com o valor FF
;	Inputs:		
;	Outputs:
;
;*****************************************************************************************************************

Ve_teclas:			PUSH R0;				guarda os Registos
					PUSH R1
					PUSH R2
					PUSH R3
					PUSH R4
										
					MOV R0,ultima_linha;	Mete o valor correspondente a ultima linha(8) em R0
					MOV R1,LINHA;			Mete o endereço da linha em R1
					MOV R2,COLUNA;			Mete o endereço da coluna em R2
					MOV R4,Isola_bits_tecla;Mete a mascara que Isola o nibble de menor peso em R4
										
Ver_linhas:			MOVB [R1],R0;			Manda a linha para o teclado
					MOVB R3,[R2]; 			Verifica se alguma tecla foi clicada na linha 

					AND R3,R4;				Isola o nibble de menor peso
					JNZ Inicia_contador;	Se tiver valor salta

					CMP R0,0;				se verificar todas as linhas e nao receber nada
					JZ Nenhuma_tecla;		salta para colocar o valor de no_tecla

					SHR R0,1; 				Testa a proxima linha
					JMP Ver_linhas;			Volta ao ciclo

Nenhuma_tecla:		MOV R0,No_tecla;    	Se nenhuma tecla for carregada o registo da tecla fica com o valor FF
					JMP Mete_tecla_memoria;	E vai meter esse valor na memoria

Inicia_contador:	MOV R1,Reseta;			Reseta o contador
					MOV R2,Reseta;			Reseta o contador

Contar_linha:		SHR R0,1; 				Desce uma linha 
					JZ Contar_coluna; 		Salta quando a linha for 0
					ADD R1,1; 				Adiciona 1 ao Contador da linha
					JMP Contar_linha;		Volta a fazer o ciclo
Contar_coluna:		SHR R3,1; 				Desce uma coluna
					JZ Qual_tecla; 			Salta quando a coluna for 0
					ADD R2,1; 				Adiciona 1 ao contador da coluna
					JMP Contar_coluna;  	Volta a fazer o ciclo
						
Qual_tecla:			SHL R1,2; 				Multiplica a linha por 4
					ADD R1,R2; 				Descobre a tecla carregada
					MOV R0,R1; 				Passa o valor da tecla carreagada

Mete_tecla_memoria:	MOV R1,Tecla_carregada;	Mete o endereço da tecla carregada em R1
					MOVB [R1],R0;			Escreve nesse endereço a ultima tecla carregada

Fim_rotina_tecla:	POP R4;					Recupera os registos
					POP R3
					POP R2
					POP R1
					POP R0
					RET

;*****************************************************************************************************************
;
;								Rotinas Secundarias do Controlo
;
;*****************************************************************************************************************
;*****************************************************************************************************************
;
;	Rotina:		Flags_controlo
;	Descrição:	Rotina que compara a tecla carregada com as respetivas para controlar o jogo
;	Inputs:	
;	Outputs:	
;
;*****************************************************************************************************************

Flags_controlo:		PUSH R0;				guarda os registos
					PUSH R1
					PUSH R2

					MOV R0,Tecla_nova;		Mete o endereço com a flag que indica se é nova tecla em R0
					MOVB R1,[R0];			Mete a flag que inidica se é um tecla nova ou não
					CMP R1,Flag_0;			Compara com 0
					JZ Comparar_fim;		Sai da rotina caso não tenha tecla nova

					MOV R1,Tecla_carregada;	Mete o endereço com a tecla carregada em R1
					MOVB R0,[R1];			Tira a tecla carregada
					MOV R2,Flag_1;			Mete 1 em R2
					
Pausar_jogo:		MOV R1,Tecla_pausa;		Mete a tecla da pausa em R1
					CMP R0,R1;				Compara a tecla carregada com esta
					JNZ Termina_jogo;		Se não for passa para a proxima verificação

					MOV R1,Flag_pausa;		Mete o endereço que indica que tem de haver uma pausa
					MOVB [R1],R2;			Liga essa flag
					JMP Comparar_fim;		E sai da rotina
					
Termina_jogo:		MOV R1,Tecla_termina;	Move a tecla que termina o jogo para R1
					CMP R0,R1;				Compara a tecla carregada com a a tecla que termina o jogo
					JNZ Comparar_fim;		Se não for igual sai da rotina

					MOV R1,Flag_termina;	Mete o endereço com a flag que indica que o jogo termina em R1
					MOVB [R1],R2;			Liga a flag que indica que o jogo tem de acabar o jogo
										
Comparar_fim:		POP R2;					Recupera os registos
					POP R1
					POP R0
					RET

;*****************************************************************************************************************
;
;	Rotina:		Comeca_jogo
;	Descrição:	Rotina que espera até que a tecla de inicio do jogo seja premida
;	Inputs:
;	Outputs:
;
;*****************************************************************************************************************

Comeca_jogo:		PUSH R0;				Guarda os registos
					PUSH R1
					PUSH R2
					PUSH R3
					
					MOV R1,Press_c_start;	Mete em R1 a tabela do ecra inicial
					CALL escreve_ecra;		Chama a rotina que o vai escrever word a word
					MOV R0,Tecla_comeca;	Mete a tecla que dá ordem para começar o jogo em R0
					MOV R1,Tecla_carregada;	Mete o endereço com a tecla carregada em R1
					MOV R3,Tecla_nova;		Mete em R3 o endereço da flag que indica se ha tecla nova

Espera_inicio:		CALL Teclado;			Chama a rotina responsavel por ler o teclado
					MOVB R2,[R3];			Tira a flag que indica se é uma tecla nova ou nao
					CMP R2,Flag_0;			Compara a com 0
					JZ Espera_inicio;		E enquanto for 0 continua no ciclo
					MOVB R2,[R1];			Tira a tecla carregada para o R2
					CMP R2,R0;				Compara a tecla carregada com a tecla que da ordem para começar o jogo
					JNZ Espera_inicio;		Se forem iguais vai começar o jogo

					MOV R1,Flag_reseta_ecra;Mete o endereço com a flag para resetar o ecra em R1
					MOV R0,Flag_1;			Mete 1 em R0
					MOVB [R1],R0;			Liga a flag para resetar o ecra
					MOV R0,Flag_termina;	Mete em R0 a flag que indica que o jogo tem de terminar
					MOV R1,Flag_0;			MEte em R1 a flag 0
					MOVB [R0],R1;			E desliga a flag que tiermina o jogo

					POP R3;					Recupera os registos
					POP R2
					POP R1
					POP R0
					RET

;*****************************************************************************************************************
;
;	Rotina:		fim_jogo
;	Descrição:	Rotina que finaliza o jogo, mostrando o ecra final e invertendo-o
;	Inputs:	
;	Outputs:
;
;*****************************************************************************************************************

fim_jogo:			PUSH R0;				Recupera os registos
					PUSH R1
					MOV R0,ciclo;			Mete 3, o numero de ciclos em R0

ciclo_fim_jogo:		MOV R1,ecra_fim_jogo;	Mete em R1 a tabela de fim de jogo
					CALL escreve_ecra;		Chama a rotina que escreve o ecrã
					CALL pausa;				Chama a rotina responsavel por fazer uma ligeira pausa
					CALL Inverte_ecra;		Chama a rotina que escreve o ecra
					CALL pausa;				Chama a rotina responsavel por fazer uma ligeria pausa
					SUB R0,1;				Diminui um ciclo
					JNZ ciclo_fim_jogo;		Enquanto este não for 0 continua o ciclo

					MOV R0,Flag_comeco;		Mete o endereço com a flag que começa o jogo em R0
					MOV R1,Flag_1;			Mete 1 em R1
					MOVB [R0],R1;			Ativa a flag que indica se o jogo deve de começar ou não

					POP R1;					Recupera os registos
					POP R0
					RET

;*****************************************************************************************************************
;
;	Rotina:		Pausa_jogo
;	Descrição:	Rotina que pausa o jogo,invertendo o ecra inicial 
;	Inputs:	
;	Outputs:
;
;*****************************************************************************************************************

Pausa_jogo:			PUSH R0;				Guarda os registos
					PUSH R1
					PUSH R2
					PUSH R3
					
					CALL Inverte_ecra;		Chama a rotina responsavel por inverter o ecrã atual
					MOV R0,Tecla_continua;	Mete em R0 a tecla que indica se o jogo deve continuar 
					MOV R1,Tecla_nova;		Mete em R1 o endereço com a flag que indica se recebeu uma tecla nova
					MOV R2,Tecla_carregada;	Mete em R2 o endereço com a ultima tecla carregada

Jogo_parado:		CALL Teclado;			Chama a rotina responsavel por ler o teclado
					MOVB R3,[R1];			Tira a flag que indica se é uma tecla nova
					CMP R3,0;				Compara-a com 0
					JZ Jogo_parado;			E se for 0 siginidca que não recebeu tecla nova

					MOVB R3,[R2];			Tira a ultima tecla carregada para R3
					CMP R0,R3;				compara-a com a tecla responsavel por começar oo jogo
					JNZ Jogo_parado;		Enquanto não for igual continua a fazer o ciclo

					CALL Inverte_ecra;		Chama a rotina que inverte oe cra atual
					POP R3;					Recupera os registos
					POP R2
					POP R1
					POP R0
					RET

;******************************************************************************************************************
;
;	Rotina:		vitoria
;	Descrição:	Rotina que finaliza o jogo quando se obtem 99 ou mais pontos, mostrando os ecrãs de vitoria
;	Inputs:	
;	Outputs:
;
;******************************************************************************************************************

vitoria:			PUSH R1;				Guarda os registos
					PUSH R2

					MOV R1,ecra_vitoria;	Mete a tabela do ecra da vitoria em R1
					CALL escreve_ecra;		Chama a rotina responsavel por escrever o ecrã
					CALL pausa;				Chama uma rotina responsavel por uma pequena pausa
					MOV R1,trofeu;			Mete a tabela com um ecra com um trofeu em R1
					CALL escreve_ecra;		E chama a rotina responsavel por escrever o ecra

sai_vitoria:		CALL Teclado;			Chama a rotina que trata do teclado
					MOV R1,Tecla_carregada;	Mete o endereço com a tecla carregada em R1
					MOVB R0,[R1];			Tira o valor da tecla para R0
					MOV R1,Tecla_comeca;	Mete em R1 a tecla que começa o jogo
					CMP R0,R1;				Compara as 2 teclas
					JNZ sai_vitoria;		E enquanto não forem iguais nao sai

					POP R2;					Recupera os registos
					POP R1

					RET

;*****************************************************************************************************************
;
;	Rotina:		pausa
;	Descrição:	Rotina que implementa uma ligeira  pausa
;	Inputs:	
;	Outputs:
;
;*****************************************************************************************************************

pausa:				PUSH R0;				Guarda R0
					MOV R0,7000;			Mete um numero 'grande' em R0

ciclo_pausa:		SUB R0,1;				Subtrai 1
					JNZ ciclo_pausa;		Até este ser 0

					POP R0;					Recupera R0	
					RET

;*****************************************************************************************************************
;
;								Rotinas Secundarias dos Ninjas
;
;*****************************************************************************************************************
;*****************************************************************************************************************
;
;	Rotina:		Ninjas_posicao_ini
;	Descrição:	Rotina que coloca os ninjas na poisção inical
;	Inputs:	
;	Outputs:
;
;*****************************************************************************************************************

Ninjas_posicao_ini:	PUSH R0;				Guarda os registos
					PUSH R1
					PUSH R2

					MOV R0,Ninja_linha;		Mete o endereço correspondente as linhas dos ninjas
					MOV R1,linha_inicial;	Mete o valor correspondente a linha inicial de um ninja(16)
					MOV R2,qntd_ninjas;		Mete a quantidade de ninjas em R2

Ciclo_posicao_ini:	MOVB [R0],R1;			Mete O VAlor da linha inicial na linha atual do ninja
					ADD R0,prox_ninja;		Adiciona ao endereço das linhas dos ninjas 1, para passar para o prox
					SUB R2,1;				Subtrai 1 ao valor da quantidade de ninjas
					JNZ Ciclo_posicao_ini;	Volta a fazer o ciclo Enquanto não tiver mudado todos os ninjas

					POP R2;					Recupera os registos
					POP R1
					POP R0
					RET

;*****************************************************************************************************************
;
;	Rotina:		Pre_escreve_ninja
;	Descrição:	Rotina que prepara registos para escrever o ninja 
;	Inputs:		R10 - Ninja escolhido
;	Outputs:	R3 - linha do 1º elemento do ninja 
;				R4 - coluna do 1º elemento do ninja
;				R5 - tabela com o ultimo elemento do "desenho" do ninja
;				R6 - altura do ninja
;				R7 - largura do ninja
;
;*****************************************************************************************************************

Pre_escreve_ninja:	PUSH R0;				Guarda os registos
					PUSH R1
					PUSH R2
					PUSH R10

Endereco_ninja:		MOV R1,Ninja_coluna;	Move o endereço com as colunas do Ninja
					ADD R1,R10;				Adiciona-lhe o nº do ninja para obter o valor certo
					MOV R2,Ninja_linha;		Move o endereço com as linhas do Ninja
					ADD R2,R10;				Adiciona-lhe o nº do ninja para obter o valor certo					

Registos:			MOVB R3,[R2];			Retira o valor da linha do Ninja
					MOVB R4,[R1];			Retira o valor da Coluna do Ninja

					MOV R5,Ninjas_tab;		Mete em R5 a tabela com o desenho do Ninja
					MOV R0,elementos_ninja;	Mete 11 no R0
					ADD R5,R0;				Soma-lhe o nº de elementos de um Ninja

					MOV R6,altura_ninja;	Mete a altura do ninja no R6
					MOV R7,largura_ninja;	Mete a largura do ninja no R7

					POP R10;				Recupera os registos
					POP R2
					POP R1
					POP R0
					RET

;*****************************************************************************************************************
;
;	Rotina:		Atualiza_ninja
;	Descrição:	Rotina que mexe os ninjas e atualiza a sua posição da linha, dependendo
;				se este subiu ou desceu
;	Inputs:		R9 - Flag que decide se o ninja desce(0) ou Sobe(1)
;				R10 - Ninja escolhido
;	Outputs:
;
;*****************************************************************************************************************

Atualiza_ninja:		PUSH R0;				Guarda os registos
					PUSH R1
					PUSH R9
					PUSH R10

					MOV R1,Ninja_linha;		Copia o endereço da tabala da altura(linha) dos ninjas
					ADD R1,R10
					MOVB R3,[R1];			Copia a altura do ninja para R3

					CMP R9,Flag_0;			Se a tecla clicada for diferente (maior) que o ninja que se vai mexer,
					JNZ Sobe_ninja;			significa que a tecla clicada foi uma para descer o ninja

Desce_ninja:		ADD R3,1;				Desce a altura do ninja em 1
					MOV R0,fim_pixelscreen;	Mete em R0 o ulltimo valor da Linha do pixelscreen
					CMP R3,R0;				Compara o valor com o valor da linha do ninja
					JNZ Atualiza;			Se forem iguais siginifica que o ninja desce

Ninja_bateu_chao:	MOV R0,Vida_dos_ninjas;	Mete o endereço com as vidas dos ninjas em R0
					ADD R0,R10;				Soma-lhe o valor do ninja para descobrir o endereço correto
					MOV R10,Flag_0;			Mete 0 em R10
					MOVB [R0],R10;			Desliga a vida do ninja
					JMP Atualiza;			E sai da rotina

Sobe_ninja:			CMP R3,Posicao_alta;	Se o ninja tiver na posição mais alta limita
					JZ Atualiza;			E sai da rotina

					SUB R3,1;				Sobe a altura do ninja em 1

Atualiza:			MOVB [R1],R3;			Atualiza a altura(linha) do ninja	
					POP R10;				Recupera os registos
					POP R9
					POP R1	
					POP R0
					RET

;*****************************************************************************************************************
;
;	Rotina:		Escreve_ninja
;	Descrição:	Rotina que escreve o ninja
;	Inputs:		R9 - Flag que decide se o ninja sobe(1) ou desce(0)
;				R10 - Ninja escolhido
;	Outputs:
;
;*****************************************************************************************************************

Escreve_ninja:		PUSH R0;				Guarda os registos
					PUSH R1
					PUSH R11

					CALL Pre_escreve_ninja;	Chama a rotina que prepara os registos para escrever o ninja
					MOV R11,Flag_0;			Mete a flag que decide que vai apagar o objeto
					CALL Escreve_objeto;	Chama a rotina responsavel por apagar e escrever o ninja
					CALL Atualiza_ninja;	Chama a rotina responsavel por atualizar a posição do Ninja
					MOV R0,Vida_dos_ninjas;	Mete o endereço com as vidas dos ninjas em R0
					ADD R0,R10;				Escolhe o endereço correto para este Ninja
					MOVB R1,[R0];			Tira o valor que ai esta
					CMP R1,Flag_0;			Compara a vida do ninja com 0
					JZ Fim_escreve_ninja;	E se for 0 sai da rotina e não vai rescrever o Ninja
					CALL Pre_escreve_ninja;	Chama rotina que vai preparar os registos atualizados para escrever o Ninja
					MOV R11,Flag_1;			Escolhe a flag que decide que vai escrever o objeto
					CALL Escreve_objeto;	Chama a rotina responsavel pela escrita do objeto

Fim_escreve_ninja:	POP R11;				Recupera os registos
					POP R1
					POP R0
					RET

;*****************************************************************************************************************
;
;						Rotina Secundaria dos Ninjas e dos Diversos
;
;*****************************************************************************************************************
;*****************************************************************************************************************
;
;	Rotina:		Verifica_embate
;	Descrição:	Rotina que verifica se uma arma ou um presente embateu num ninja
;	Inputs:		R9 - Numero do diverso
;				R10 - Numero do ninja
;	Outputs:
;
;*****************************************************************************************************************

Verifica_embate:	PUSH R0
					PUSH R1
					PUSH R2
					PUSH R3
					PUSH R4

Posicao_ninja_lin:	MOV R2,Ninja_linha;		Mete em R2 o endereço com as linhas do ninja
					ADD R2,R10;				Escolhe a linha do ninja correta
					MOVB R0,[R2];			Descobre a linha do primeiro elemento do ninja
					MOV R1,R0;				Copia o primeiro elemento
					MOV R2,altura_ninja;	Move a distancia da altura entre o 1º e 2º elemento para R1
					SUB R1,R2;				Descobre a linha do ultimo elemento
Posicao_arma_lin:	MOV R4,Diversos_linha;	Mete em R4 o endereço com as linhas dos diversos
					ADD R4,R9;				Escolhe a linha do endereço correto
					MOVB R2,[R4];			Descobre a linha do primeiro elemento do diverso
					MOV R3,R2;				Copia a linha do primeiro elemento para R3
					MOV R4,Diversos_altura;	Mete em R4 a altura dos diversos
					SUB R3,R4;				Descobre a linha do ultimo elemento do diverso

Ve_se_bateu_lin:	CMP R0,R3;				Compara a linha do 1º elemento do ninja com a linha do 2º elemento do diverso
					JLE Fim_embate;			Se a linha do 1º elemento do ninja for maior siginifica que pode haver colisao
					CMP R1,R2;				Compara a linha do 2º elemento do ninja com a linha do 1º elemento do diverso
					JGE Fim_embate;			Se alinha do 2º elemnto do ninja for menor siginifica que intercetam-se nas linhas				

Posicao_ninja_col:	MOV R2,Ninja_coluna;	Mete em R2 o endereço com as colunas do ninja
					ADD R2,R10;				Escolhe a coluna do ninja certo
					MOVB R0,[R2];			Descobre a coluna do primeiro elemento do ninja
					MOV R1,R0;				Copia a Coluna do 1º elemento do ninja
					MOV R2,largura_ninja;	Mete em R2 a largura do ninja
					SUB R1,R2;				Descobre a coluna do ultimo elemento do ninja
Posicao_arma_col:	MOV R4,Diversos_coluna;	Mete em R4 o endereço com as colunas dos diversos
					ADD R4,R9;				Escolhe a coluna do diverso correspondente
					MOVB R2,[R4];			Descobre a coluna do primeiro elemento do diverso
					MOV R3,R2;				Copia a coluna do 1º elemento do diverso
					MOV R4,Diversos_largura;Mete em R4 a largura dos diversos
					SUB R3,R4;				Descobre a coluna do ultimo elemento do diverso

Ve_se_bateu_col:	CMP R0,R3;				Compara a coluna do 1º elemento do ninja com a coluna do 2º elemento do diverso
					JLE Fim_embate;			Se a coluna do 1º elemento do ninja foi maior siginifica que pode haver colisao
					CMP R1,R2;				Compara a coluna do 2º elemento do ninja com a coluna do 1º elemento do diverso
					JGE Fim_embate;			Se a Coluna do 2ºº elemento do ninja for menor siginifica que pode haver colisao

Houve_colisao:		MOV R0,Flag_diversos;	Mete o endereço das flags dos diversos em R0
					ADD R0,R9;				Escolhe a flag correta
					MOVB R1,[R0];			Tira o valor dessa flag
					CMP R1,Flag_presente;	Compara-a com a flag do presente
					JZ Adiciona_3_pontos;	E se esta for um presente salta para adicionar 3 pontos

Mata_o_ninja:		MOV R0,Vida_dos_ninjas;	Mete em R0 o endereço com as vidas do ninjas
					ADD R0,R10;				Escolhe o ninja correto
					MOV R1,Flag_0;			Mete em R1, a Flag_0
					MOVB [R0],R1;			Desliga a flag da vida no  ninja
					CALL Escreve_ninja;		Chama a rotina que escreve o ninja( que o vai apenas apagar)
					JMP Destroi_diverso;	E salta para destruir o diverso

Adiciona_3_pontos:	MOV R0,colisao_presente;Mete em R0 o endereço da flag que diz que houve uma colisao com um presente
					MOV R1,Flag_1;			Mete em R1 o numero 1
					MOVB [R0],R1;			LIga a flag que houve colisao com um presente

Destroi_diverso:	MOV R0,Vida_dos_diversos;Mete em R0 o endereço com as vidas dos diversos
					ADD R0,R9;				Escolhe o diverso correto
					MOV R1,Flag_0;			Mete em R1 a flag 0
					MOVB [R0],R1;			DEsliga a flag da vida do diverso
					CALL Escreve_diversos;	Chama a rotina que vai apagar o diverso
					
Fim_embate:			POP R4;					Recupera os registos
					POP R3
					POP R2
					POP R1
					POP R0
					RET

;*****************************************************************************************************************
;
;								Rotinas Secundarias dos Diversos
;
;*****************************************************************************************************************
;*****************************************************************************************************************
;
;	Rotina:		Pre_escreve_diversos
;	Descrição:	Rotina que prepara registos para lançar as armas
;	Inputs:		R9 - Qual arma (0 ou 1)
;	Outputs:	R3 - linha do 1º elemento da arma
;				R4 - coluna do 1º elemento da arma
;				R5 - tabela com o ultimo elemento do "desenho" do ninja
;				R6 - altura da arma
;				R7 - largura da arma
;
;*****************************************************************************************************************

Pre_escreve_diversos:PUSH R0;				Guarda os registos
					PUSH R1
					PUSH R2
					PUSH R9

Vai_buscar_coluna:	MOV R0,Diversos_coluna;	Mete o endereço com as colunas dos diversos em R0
					ADD R0,R9;				Soma a esse endereço o nº do diverso
					MOV R2,Diversos_linha;	Mete o endereço com as linhas dos diversos em R2
					ADD R2,R9;				Soma  a esse endereço o nº do Diverso

Prepara_registos:	MOVB R3,[R2];			Tira o valor da linha do primeiro elemento do diverso para R3
					MOVB R4,[R0];			Tira o valor da Coluna do primeiro elemento do diverso para R4

					MOV R0,Flag_diversos;	Mete o endereço correspondente a flag que indica se o diverso é uma arma ou um presente
					ADD R0,R9
					MOVB R2,[R0];			Tira o valor que esta la para R2
					CMP R2,Flag_presente;	E Compara-o com 0
					JZ Mete_tabela_present;	Se for 0 salta para por a tabela de 1 presente

Mete_tabela_arma:	MOV R5,Arma;			Se não for 0 mete a tabela correspondente a arma no R5
					JMP Prepara_registo_fim;Salta por cima da label que mete a tabela do presente

Mete_tabela_present:MOV R5,Presente;		Mete a tabela do presente em R5

Prepara_registo_fim:MOV R0,Diversos_elem;	Mete a qntd de elementos dos diversos em R0
					ADD R5,R0;				Adiciona a tabela esse valor
					MOV R6,Diversos_altura;	Mete a altura dos diversos em R6
					MOV R7,Diversos_largura;Mete a larguta dos diversos em R7

					POP R9;					Recupera os registos
					POP R2
					POP R1
					POP R0
					RET

;*****************************************************************************************************************
;
;	Rotina:		Mexe_armas_presente
;	Descrição:	Rotina que mexe as armas e presente e atualiza a sua posição da coluna e verifica se bate na parede
;	Inputs:		R9 - Qual diverso
;	Outputs:
;
;*****************************************************************************************************************

Mexe_armas_presente:PUSH R0;				Guarda registos
					PUSH R1
					PUSH R9
					
					MOV R1,Diversos_coluna;	move o endereço com as colunas dos diversos para R1
					ADD R1,R9;				Adiciona o numero do diverso ao endereço
					MOVB R0,[R1];			E tira o valor das colunas do diverso escolhido
					SUB R0,1;				E subtrai-se 1
					MOVB [R1],R0;			E atualiza-se o valor que estava no endereço
					
Bateu_na_parede:	MOV R1,Diversos_largura0;Mete no R1 a largura dos diversos contando com o 0 como um elemento que neste caso é 2
					SUB R0,R1;				Subtrai o valor da coluna com 2
					JNZ Fim_mexe_diverso;	Se for 0 siginifca que bateu na parede

					MOV R0,Vida_dos_diversos;Mete o endereço das vidas dos diversos em R0
					ADD R0,R9;				Adiciona a esse endereço o numero do diverso
					MOV R1,Flag_0;			Mete o valor 0 em R1
					MOVB [R0],R1;			Mete a correspondente a vida do diverso a 0

Fim_mexe_diverso:	POP R9;					Recupera os registos
					POP R1
					POP R0
					RET


;*****************************************************************************************************************
;
;	Rotina:		Escreve_diversos
;	Descrição:	Rotina que escreve os presentes e as armas
;	Inputs:		R9 - Qual diverso
;	Outputs:
;
;*****************************************************************************************************************

Escreve_diversos:	PUSH R0;				Guarda registos
					PUSH R1
					PUSH R2
					PUSH R11
					
					CALL Pre_escreve_diversos;Chama a rotina que prepara os registos para escrever o diverso
					MOV R11,Flag_0;			Escolhe a flag para apagar
					CALL Escreve_objeto;	Chama a rotina responsavel por escrever e apagar um objeto
					CALL Mexe_armas_presente;Chama a rotina que atualiza a posição do Ninja
					
					MOV R0,Vida_dos_diversos;Mete o endereço das vidas dos diversos em R0
					ADD R0,R9;				Adiciona a esse endereço o numero do diverso
					MOVB R2,[R0];			Tira o valor da vida desse diverso
					CMP R2,Flag_0;			Compara com 0
					JZ fim_escrev_diversos;	E se estiver a 0 siginifca que não vai escrever o diverso, porque este morreu

					CALL Pre_escreve_diversos;Chama a rotina que prepara os registos para escrever o diverso
					MOV R11,Flag_1;			Escolhe a flag para escrever
					CALL Escreve_objeto;	Chama a rotina responsavel pela escrita de um objeto

fim_escrev_diversos:POP R11;				Recupera os registos
					POP R2
					POP R1
					POP R0
					RET

;*****************************************************************************************************************
;
;	Rotina:		Gera_num_0_a_3
;	Descrição:	Rotina que gera um numero semi aleatorio entre 0 a 3
;	Inputs:		
;	Outputs:	R0
;
;*****************************************************************************************************************	

Gera_num_0_a_3:		PUSH R1;				Guarda o registo

					MOV R1,numero_aleatorio;Mete o endereço com um numero aleatorio em R1
					MOVB R0,[R1];			Tira esse numero aleatorio
					MOV R1,Mascara_num_0a3;	Mete uma mascara que limita um numero aos seus 2 bits de menor peso
					AND R0,R1;				Limita o numero aleatorio aos dois bits de menor peso
				
					POP R1;					Recupera o registo
					RET

;*****************************************************************************************************************
;
;	Rotina:		Gera_num_0_a_7
;	Descrição:	Rotina que gera um numero semi aleatorio entre 0 a 7
;	Inputs:		
;	Outputs:	R0
;
;*****************************************************************************************************************	

Gera_num_0_a_7:		PUSH R1;				Guarda o registo

					MOV R1,numero_aleatorio;Mete o endereço com um numero aleatorio em R1
					MOVB R0,[R1];			Tira esse numero aleatorio
					MOV R1,Mascara_num_0a7;	Mete uma mascara que limita um numero aos seus 3 bits de menor peso
					AND R0,R1;				Limita o numero aleatorio aos tres bits de menor peso
				
					POP R1;					Recupera o registo
					RET


;*****************************************************************************************************************
;
;	Rotina:		Cria_diverso
;	Descrição:	Rotina que cria uma arma ou um presente aleatoriamente
;	Inputs:		R9 - numero do diverso
;	Outputs:
;
;*****************************************************************************************************************

Cria_diverso:		PUSH R0;				Guarda os registos
					PUSH R1
					PUSH R2
					PUSH R9
					
					CALL Gera_num_0_a_3;	Chama a rotina que arranja um numero aleatorio entre 0 a 3 e mete o no R0
					MOV R2,Flag_diversos;	Move o endereço que contem as flags que indicam se é presente ou arma para R3 
					ADD R2,R9
					CMP R0,Flag_presente
					JZ Cria_presente;		Se esse valor for 0 vamos criar um presente

Cria_arma:			MOV R1,Flag_arma;		Move 1 para R1 
					JMP Cria_diverso_fim;	Salta por cima do cria presente

Cria_presente:		MOV R1,Flag_presente;	Move 0 para R1

Cria_diverso_fim:	MOVB [R2],R1;			Mete o valor correspondente a arma(1) ou presente(0)
					
					MOV R1,Diversos_linha_ini;Move a tabela com o valor das linhas inicias dos 2 diversos
					ADD R1,R9;				Escolhe o elemento da tabela certo
					MOVB R2,[R1];			E tira o valor inicial da linha correspondente
					CALL Gera_num_0_a_7
					ADD R2,R0;				E soma-lhe um numero aleatorio entre 0 a 7
					MOV R1,Diversos_linha;	Mete o endereço correspondente as linhas dos diversos
					ADD R1,R9;				Soma-lhe o valor do diverso para obter o valor correto do endereço
					MOVB [R1],R2;			E coloca lá o valor da linha inicial + numero aleatorio

					MOV R1,Diversos_coluna;	Mete o endereço correspondente as colunas dos diversos em R1
					ADD R1,R9;				Soma-lhe o numero do diverso
					MOV R0,Diversos_coluna_ini;Vai buscar o valor inicial da coluna de um diverso
					MOVB [R1],R0;			E mete esse valor no endereço com as colunas do diverso

					MOV R1,Vida_dos_diversos;
					ADD R1,R9
					MOV R0,Flag_1;			Mete 1 em R2
					MOVB [R1],R0;			Liga a flag da vida do diverso

					POP R9;					Recupera os registos
					POP R2
					POP R1
					POP R0
					RET

;*****************************************************************************************************************
;
;								Rotinas Secundaria gerais que escrevem o ecrã
;
;*****************************************************************************************************************
;*****************************************************************************************************************
;
;	Rotina:		Escreve_pixel
;	Descrição:	Rotina que escreve ou apaga um determinado pixel no ecrã, dependendo da linha e coluna
;				escolhida para pintar
;	Inputs:		R3 - Linha escolhida
;				R4 - Coluna escolhida
;				R10 - Flag que decide se vai pintar ou apagar (0-apaga,1-pinta)
;	Outputs:
;
;*****************************************************************************************************************

Escreve_pixel:		PUSH R0;				Guarda os registos
					PUSH R1
					PUSH R2
					PUSH R3
					PUSH R4
					PUSH R10
					MOV R1,R4;				Copia o valor da coluna para o R1
					
					MOV R0,8;				Mete 8 no R0
					MOD R1,R0;				Descobre o bit que vai escrever
					MOV R2,Mascaras_pixel_1
					ADD R1,R2;				Descobre de onde vai tirar o que vai escrever					

					SHL R3,Dois_bits;		Multiplica a linha por 4
					DIV R4,R0;				Divide a coluna por 8
					ADD R3,R4;				Descobre o byte
					
					MOV R0,ECRA;			Mete o endereço no ecra em R0
					ADD R0,R3;				Descobre o endereço onde vai escrever

					MOV R4,Reseta;			Reseta o R4
					MOVB R4,[R0];			Copia o que esta no byte do ecra onde se vai pintar
					MOVB R3,[R1];			Copia o que vai pintar

					CMP R10,0;				Se a flag for 0
					JNZ Liga_pixel;			É para apagar

Apaga_pixel:		NOT R3;					Faz o inverso de R3(para obter uma mascara com todos os bits a 1 exceto o que queremos retirar)
					AND R4,R3;				Apaga o pixel escolhido ao que estava no ecrã
					JMP Fim_escreve_pixel

Liga_pixel:			OR R4,R3;				Caso algo já estivesse escrito no ecra vai continuar escrito

Fim_escreve_pixel:	MOVB [R0],R4;			Coloca no ecra o que la estava + a mudança
					
					POP R10;				Recupera os registos
					POP R4
					POP R3
					POP R2
					POP R1
					POP R0
					RET

;*****************************************************************************************************************
;
;	Rotina:		Escreve_objeto
;	Descrição:	Rotina que escreve ou apaga um determinado objeto pixel a pixel
;	Inputs:		R3 - linha do 1º elemento
;				R4 - coluna do 1º elemento
;				R5 - tabela do objeto com o ultimo elemento do "desenho"
;				R6 - altura do objeto
;				R7 - largura do objeto	
;				R11 - Flag ,se for o = apaga e 1 = pinta
;	Outputs:
;
;*****************************************************************************************************************

Escreve_objeto:		PUSH R0
					PUSH R1;				Guarda registos
					PUSH R2
					PUSH R3
					PUSH R4
					PUSH R5
					PUSH R6
					PUSH R7
					PUSH R8
					PUSH R9
					PUSH R10
					
					MOV R2,R4;				Copia  a coluna do 1º elemento para R2
					SUB R2,R7;				Descobre o ultima coluna a ser escrita
					MOV R1,R3;				Copia a linha do 1ºelemento para R1
					SUB R1,R6;				Descobre a ultima linha a ser escrita

					MOV R0,R4;				Copia a coluna para R8
					CMP R11,0;				Compara o valor da flag que decide se apaga ou escreve um objeto com 0
					JZ Apaga;				E se este for 0 siginifca que vai apagar

Escreve:			CMP R4,R2;				Compara a coluna atual com a ultima coluna
					JZ escreve_prox_linha;	Salta se for igual a esta

					MOVB R9,[R5];			Move o valor que vai escrever
					CMP R9,0 
					JZ escreve_prox_col;	e se este for 0 passa para o proximo

					MOV R10,Flag_1; 		Move 1 para R10
					CALL Escreve_pixel;		Chama a rotina para pintar pixeis 

escreve_prox_col:	SUB R5,1;				Diminui um endereço
					SUB R4,1;				Diminui uma coluna
					JMP Escreve;			E volta a fazer ciclo

escreve_prox_linha:	SUB R3,1;				Sobe uma linha
					CMP R3,R1;				Compara a linha atual com a ultima linha
					JZ fim_escreve_objeto;	Salta se for igual a esta
					MOV R4,R0;				Recupera o valor inical das Colunas
					JMP Escreve;			E volta a fazer o ciclo escreve

Apaga:				CMP R4,R2;				Compara a coluna atual com a ultima coluna
					JZ apaga_prox_linha;	Salta se for igual a esta

					MOV R10,Flag_0
					CALL Escreve_pixel;		Chama a rotina para apagar pixeis
					SUB R4,1;				Diminui uma coluna
					JMP Apaga;				E volta a fazer ciclo

apaga_prox_linha:	SUB R3,1;				Sobe uma linha
					CMP R3,R1;				Compara a linha atual com a ultima linha
					JZ fim_escreve_objeto;	Salta se for igual a esta
					MOV R4,R0;				Recupera o valor inical das Colunas
					JMP Apaga;				E volta a fazer o ciclo apaga

fim_escreve_objeto:	POP R10;				Recupera registos
					POP R9
					POP R8
					POP R7
					POP R6
					POP R5			
					POP R4
					POP R3
					POP R2
					POP R1
					POP R0
					RET

;*****************************************************************************************************************
;
;	Rotina:		escreve_ecra
;	Descrição:	Rotina que escreve o ecra byte a byte
;	Inputs:		R1 - Tabela de strings
;	Outputs:	
;
;*****************************************************************************************************************

escreve_ecra:		PUSH R0;				Guarda os registos
					PUSH R2
					PUSH R3
					MOV R0,ECRA;			Mete o endereço do ecrã em R0
					MOV R2,BTS_ECRA;		Mete o numero de bytes do ecra em R2

escreve_ecra_ciclo:	MOV R3,[R1];			Tira o valor da tabela de strings para R3
					MOV [R0],R3;			Mete esse valor no ecrã

					ADD R0,2;				Soma 2 ao endereço do ecrã para obter a prox word
					ADD R1,2;				Soma 2 ao endereço da tabela para obter a prox word
					SUB R2,2;				Tira 2 ao numero de bytes do ecra
					JNZ escreve_ecra_ciclo;	Enquanto este não for 0 continua o ciclo

					POP R3;					Recupera os registos
					POP R2
					POP R0
					RET

;*****************************************************************************************************************
;
;	Rotina:		Inverte_ecra
;	Descrição:	Rotina que copia o ecra e inverte-o byte a byte
;	Inputs:	
;	Outputs:
;
;*****************************************************************************************************************

Inverte_ecra:		PUSH R0
					PUSH R2
					PUSH R3
					MOV R0,ECRA;			Mete o endereço do ecrã em R0
					MOV R2,BTS_ECRA;		Mete o numero de bytes do ecra em R2

inverte_ecra_ciclo:	MOV R3,[R0];			Tira o valor que esta no byte do ecra
					NOT R3;					Inverte o que estava no ecra
					MOV [R0],R3;			E volta a meter o valor no ecra
					
					ADD R0,2;				Soma 2 ao endereço do ecra para obter a prox word
					SUB R2,2;				Tira 2 bytes ao numero de bytes do ecra
					JNZ inverte_ecra_ciclo;	Enquanto este não for 0 continua o ciclo

					POP R3;					Recupera os registo
					POP R2
					POP R0
					RET

;*****************************************************************************************************************
;
;								Rotinas de interrupção
;
;*****************************************************************************************************************
;*****************************************************************************************************************
;
;	Rotina:		Interrupcao_0
;	Descrição:	Rotina de interrupção que ativa uma flag
;
;*****************************************************************************************************************

Interrupcao_0:		PUSH R0;				Guarda os registos
					PUSH R1

					MOV R0,Ninjas_int_0;	Mete o endereço da flag de int 0 em R0
					MOV R1,qntd_ninjas;		Move a quantidade de ninjas (4) para R1 
					MOVB [R0],R1;			Mete 4 na flag int 0

					POP R1;					Recupera os registos
					POP R0
					RFE

;*****************************************************************************************************************
;
;	Rotina:		Interrupcao_1
;	Descrição:	Rotina de interrupção que ativa uma flag
;
;*****************************************************************************************************************

Interrupcao_1:		PUSH R0;				Guarda os registos
					PUSH R1

					MOV R0,Flag_int_1;		Mete o endereço da flag de int 1 em R0	
					MOV R1,Flag_1;			Mete 1 em R1
					MOVB [R0],R1;			Ativa a flag de int 1

					POP R1;					Recupera registos
					POP R0
					RFE
					

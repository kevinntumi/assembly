.data
     introduza_numero:      .asciiz "\n Introduza o numero :"
     numero_par: .asciiz "\n O numero eh par"
     numero_impar:	.asciiz "\n O numero eh impar"
     numero_nem_par_nem_impar: .asciiz "\n O numero nao eh par nem impar"
     msg_condicao: .asciiz "\n Introduza um numero maior ou igual a 0!"
	 
     .globl main  
     .text

main:                                  
     la $a0, introduza_numero        
     li $v0, 4 
     syscall 

     li $v0, 5             
     syscall
     move $t0, $v0     

     blt $t0, $zero, mostrar_mensagem  
     beq $t0, $zero, num_nem_par_nem_impar  
     
     li $t1, 2
     div $t2, $t0, $t1   
     mfhi $t3

     bne $t3, $zero, num_impar
     beq $t3, $zero, num_par

     li $v0, 10                          
     syscall

mostrar_mensagem:
     la $a0, msg_condicao        
     li $v0, 4 
     syscall 

     j main

num_nem_par_nem_impar:
     la $a0, numero_nem_par_nem_impar          # atribuicao do endereco da expressao
     li $v0, 4                                 # codigo syscall imprimir a mensagem
     syscall

     j fim

num_impar: 
     la $a0, numero_impar
     li $v0, 4 
     syscall

     j fim
	
num_par:  
     la $a0, numero_par
     li $v0, 4 
     syscall

     j fim

fim:  
     li $v0, 10                          
     syscall 
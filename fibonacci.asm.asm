# Programa em assembly 
#--sequencia_de_fibonacci_1_a_n.asm-- 

    .globl main                                # programa principal
    .text                                      # Instrucoes do programa 
main:                                          # introducao da funcao principal
     la $a0, msg                               # atribuicao do endereco da expressao em numero
     li $v0, 4                                 # codigo syscall imprimir a mensagem
     syscall                                   # imprime a mensagem a "Introduza o numero"  
     li $v0, 5                                 # le o numero e atribui ao registrador $v0
     syscall
     move $t0, $v0                             # $t0 = $v0	 
    
     ble $t0, 0, main                          # se o numero introduzido for igual a 0, volta a main
     beq $t0, 1, inicio_ciclo                  # se o numero introduzido for igual a 1, passa para o inicio_ciclo

     la $a0, msg_imprimir                      # atribuicao do endereco da expressao em numero
     li $v0, 4                                 # codigo syscall imprimir a mensagem
     syscall

     la $s1, 1

     move $a0, $s1                            # Para imprimir o valor da atribuido ao registrador $a0, $a0 = $s1 = 1
     li $v0, 1           
     syscall                                   # Imprime o valor da soma na consola 

     la $t1, 0                                 # atribuicao do endereco a 1
     la $t2, 1                                 # atribuicao do endereco a 1
     la $t3, 1                                 # atribuicao do endereco a 2 - eh o contador
     la $s0, 0                                 # atribuicao do endereco a 0

     bgt $t0, 1, ciclo                         # se o numero introduzido for maior que 1, passa para o ciclo

inicio_ciclo:
     la $a0, msg_imprimir                      # atribuicao do endereco da expressao em numero
     li $v0, 4                                 # codigo syscall imprimir a mensagem
     syscall

     la $s1, 1

     move $a0, $s1                            # Para imprimir o valor da atribuido ao registrador $a0, $a0 = $s1 = 1
     li $v0, 1           
     syscall                                   # Imprime o valor da soma na consola 

     li $v0, 10 
     syscall                                   # Termina o programa.

ciclo:                                         # inicio do ciclo  
     beq $t3, $t0, fimciclo                    # se $t3 == $t0 salto ao fim do ciclo 
    
     la $a0, msg_imprimir                      # atribuicao do endereco da expressao em numero
     li $v0, 4                                 # codigo syscall imprimir a mensagem
     syscall

     add $s0, $t1, $t2

     move $a0, $s0                             # Para imprimir o valor atribuido ao registrador $a0, $a0 = $s0
     li $v0, 1           
     syscall                                   # Imprime o valor da soma na consola 
       	 
     addi $t3, $t3, 1                          # incremento do contador: contador = contador + 1 

     bgt $t1, $t2, dar_valor_t_dois            # se $t1 for maior que $t2, $t2 = $s0
     bgt $t2, $t1, dar_valor_t_um              # se $t2 for maior que $t1, $t1 = $0
     beq $t1, $t2, dar_valor_t_dois            # se $t1 == $t2, ou pode se dar o valor a t2 como tambem pode se dar o valor a t1, qualquer vale

     j ciclo                                   # salto incondicional ao inicio do ciclo  

dar_valor_t_dois:
     move $t2, $s0
     j ciclo                     #eh sempre verdade, para qualquer valor de $t2 (pois $t2 sempre sera maior que 0)
    
dar_valor_t_um:
     move $t1, $s0
     j ciclo                     #eh sempre verdade, para qualquer valor de $t3 (pois $t3 sempre sera maior que 0)
     
fimciclo:	                                   # fim do ciclo
     li $v0, 10 
     syscall                                   # Termina o programa.

    .data                                      # seccao de dados do programa:
    msg:      .asciiz "Introduza o numero:"
    msg_imprimir: .asciiz "\n O numero eh: "

# Fim do programa soma dos numero a n 

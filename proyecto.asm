#REGISTROS
#----------------------------------------------
#	t0 = Contador de monedas
#       t1 = Numero a llamar
#----------------------------------------------

.data
 ingreso: .asciiz "Ingrese monedas: "
 salto: .asciiz "\n"
 incorrecto: .asciiz "Moneda no valida"
 saldo: .asciiz "Saldo\n"
 numero: .asciiz "Ingrese el numero a llamar: "
 cMinuto: .asciiz "Costo de llamada por minuto: "
 inicio: .asciiz "Desea iniciar la llamada?"
 cFinal: .asciiz "Costo de la llamada"
 duracion: .asciiz "Duracion de la llamada"
 cambio: .asciiz "Su cambio es:"
 error: .asciiz "Moneda no valida"
 zeroAsFloat: .float 0.0
 ins: .asciiz "Para si ingrese 1\nPara no ingrese 0\n"
 repetir: .asciiz "Desea ingresar otra moneda?\n"
 buffer: .space 10
.text
.globl main

main:
	lwc1 $f4, zeroAsFloat 
	
	jal instrucciones
	j ingresar
	j repe

parte2:
	li $v0, 4
	la $a0, saldo
	syscall
	
	li $v0, 4
	la $a0, numero
	syscall
	
	li $v0, 8
	la $a0, buffer
	li $a1, 11
	move $t1, $a0
	syscall
	
	li $v0, 4
	la $a0, salto
	syscall
	
	li $v0, 4
	la $a0, cMinuto
	syscall
	#jal random
	
	j done
	
#Solicita el ingreso de monedas
ingresar:

			
	li $v0, 4
	la $a0, ingreso
	syscall
	
	li $v0, 6
	syscall
	
	li $v0, 4
	la $a0, salto
	syscall
	
	
	add.s $f12, $f0, $f4
	
	jal repe	

#Pregunta si quiere repetir el ingreso de monedas	
repe:
	
	li $v0, 4
	la $a0, repetir
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	beq $t0, $zero, parte2
	j ingresar
	
		


#Imprime las instrucciones del programa
instrucciones:
	li $v0, 4
	la $a0, ins
	syscall
	jr $ra

random: 
        li $a1, 10
	li $v0, 42
	syscall

#Finaliza el programa
done:
	li $v0,10
	syscall

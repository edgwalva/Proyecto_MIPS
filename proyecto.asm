.data
 ingreso: .asciiz "Ingrese monedas: "
 salto: .asciiz "\n"
 incorrecto: .asciiz "Moneda no valida"
 saldo: .asciiz "Saldo: $"
 numero: .asciiz "Ingrese el numero a llamar:"
 cMinuto: .asciiz "Costo de llamada por minuto:"
 inicio: .asciiz "Desea iniciar la llamada?"
 cFinal: .asciiz "Costo de la llamada"
 duracion: .asciiz "Duracion de la llamada"
 cambio: .asciiz "Su cambio es:"
 
.text
.globl main

main:
	li $v0, 4
	la $a0, ingreso
	syscall
	#--------------
	li $v0, 4
	la $a0, salto
	syscall
	#--------------
	
	j done
	
random:
	li $v0, 43
	syscall
	li $v0, 2
	syscall
	#--------------
done:
	li $v0,10
	syscall
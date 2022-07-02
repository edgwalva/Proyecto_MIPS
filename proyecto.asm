#REGISTROS
#----------------------------------------------
#	t0 = Contador de monedas
#       t1 = Numero a llamar
#----------------------------------------------

.data
 ingreso: .asciiz "Ingrese su moneda: "
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
 p: .float 0.12
.text
.globl main

main:
	lwc1 $f4, zeroAsFloat 
	
	#imprime isntrucciones
	jal instrucciones
	
	#Llama al ingreso de monedas
	jal ingresar
	
	#Nueva linea
	li $v0, 4
	la $a0, salto
	syscall
	
	#Solicita el ingreso del numero de telefono
	li $v0, 4
	la $a0, numero
	syscall
	
	#Para leer el numero ingresado, se establece que maximo tenga 10 digitos
	li $v0, 8
	la $a0, buffer
	li $a1, 11
	move $t1, $a0
	syscall
	
	#Nueva linea
	li $v0, 4
	la $a0, salto
	syscall
	
	#Valor por minuto
	li $v0, 4
	la $a0, cMinuto
	syscall
	
	#Generar cuanto va a costar el minuto.
	#Simular la llamada
	#calcular el costo
	#calcular el cambio
	
	#Termina el programa
	j done
	
#Solicita el ingreso de monedas
ingresar:
	
	li $v0, 4
	la $a0, ingreso
	syscall
	
	li $v0, 6
	syscall
	
	add.s $f12, $f12, $f0
	
	li $v0, 4
	la $a0, salto
	syscall
	
	j repe	

#Para regresar a main e imprimir la suma de monedas	
seguir:	
	li $v0, 4
	la $a0, saldo
	syscall
	
	li $v0, 2
	add.s $f11, $f12, $f4
	syscall
	#Regresas a main linea 31
	jr $ra

#Pregunta si quiere repetir el ingreso de monedas	
repe:
	
	li $v0, 4
	la $a0, repetir
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	
	beq $t0, $zero, seguir
	j ingresar
	
		


#Imprime las instrucciones del programa
instrucciones:
	li $v0, 4
	la $a0, ins
	syscall
	
	#Regresas a main linea 30
	jr $ra


#Finaliza el programa
done:
	li $v0,10
	syscall

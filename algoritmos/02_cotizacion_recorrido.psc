Algoritmo CotizacionRecorrido
	Definir nombreRecorrido Como Caracter
	Definir precioPorPersona, cantidadPersonas Como Entero
	Definir total, anticipo, saldo Como Entero

	Escribir "Nombre del recorrido:"
	Leer nombreRecorrido
	Escribir "Precio por persona:"
	Leer precioPorPersona
	Escribir "Cantidad de personas:"
	Leer cantidadPersonas

	total <- precioPorPersona * cantidadPersonas
	anticipo <- Redon(total * 0.30)
	saldo <- total - anticipo

	Escribir "Recorrido: ", nombreRecorrido
	Escribir "Total: $", total
	Escribir "Anticipo (30%): $", anticipo
	Escribir "Saldo pendiente: $", saldo
FinAlgoritmo

Algoritmo CuentaGrupo
	Definir cantidadBicicletas, horas, precioPorHora Como Entero
	Definir precioRecorridoPorPersona, cantidadPersonas Como Entero
	Definir valorAlquiler, valorRecorrido, subtotal Como Entero
	Definir aporte, total Como Entero
	Definir valorPorPersonaExacto Como Real
	Definir valorPorPersonaRedondeado Como Entero

	precioPorHora <- 10000
	Escribir "Cantidad de bicicletas urbanas:"
	Leer cantidadBicicletas
	Escribir "Horas de alquiler:"
	Leer horas
	Escribir "Precio del recorrido por persona (0 si no se reserva):"
	Leer precioRecorridoPorPersona
	Escribir "Cantidad de personas:"
	Leer cantidadPersonas

	valorAlquiler <- cantidadBicicletas * horas * precioPorHora
	valorRecorrido <- precioRecorridoPorPersona * cantidadPersonas
	subtotal <- valorAlquiler + valorRecorrido
	aporte <- subtotal * 10 / 100
	total <- subtotal + aporte
	valorPorPersonaExacto <- total / cantidadPersonas

	// Las cantidades y los valores monetarios de entrada son enteros positivos.
	// Trunc((total + personas * 100 - 1) / (personas * 100)) calcula el
	// techo del valor exacto por persona en centenas, sin errores de redondeo real.
	valorPorPersonaRedondeado <- Trunc((total + cantidadPersonas * 100 - 1) / (cantidadPersonas * 100)) * 100

	Escribir "Alquiler: $", valorAlquiler
	Escribir "Recorrido: $", valorRecorrido
	Escribir "Subtotal: $", subtotal
	Escribir "Aporte voluntario (10%): $", aporte
	Escribir "Total: $", total
	Escribir "Valor exacto por persona: $", valorPorPersonaExacto
	Escribir "Valor por persona redondeado a la centena: $", valorPorPersonaRedondeado
FinAlgoritmo

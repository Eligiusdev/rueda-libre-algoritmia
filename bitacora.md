# Bitácora: alquiler de una bicicleta

## Primera versión del algoritmo

Esta es la versión inicial, antes de revisar sus decisiones y condiciones de término:

1. El cliente camina hacia la zona de recepción del local.
2. Saluda al personal encargado del servicio.
3. Solicita el alquiler de una bicicleta.
4. El personal informa la disponibilidad de bicicletas y ofrece el servicio de rutas guiadas.
5. Si hay rutas guiadas disponibles, el cliente solicita información sobre el recorrido y el guía asignado.
6. Si no hay bicicletas disponibles, el cliente se despide y sale del local. Fin del proceso.
7. Si hay bicicletas disponibles, el cliente completa el formulario de registro con sus datos personales.
8. El cliente pregunta si el pago debe realizarse por adelantado o al finalizar el recorrido.
9. El personal entrega la bicicleta, el casco y el candado.
10. El cliente inspecciona visualmente el casco, la bicicleta y el candado para comprobar que estén en buenas condiciones.
11. Si detecta un fallo o desperfecto, informa al personal para que cambie el artículo y vuelve al paso anterior.
12. Si no encuentra desperfectos, confirma que el equipo está en buenas condiciones.
13. El cliente sale del local con la bicicleta, el casco y el candado para iniciar su recorrido.

## Ambigüedades identificadas en la revisión

Al revisar la primera versión se encontraron estas decisiones y condiciones sin especificar:

1. **Rutas guiadas:** no se indica qué ocurre si el cliente no desea una ruta, si no hay guía disponible o si el cliente no acepta la ruta ofrecida.
2. **Pago:** se pregunta cuándo pagar, pero no se fija una política ni se explica qué sucede si el cliente no acepta el costo o no puede pagar.
3. **Reemplazo de equipo:** «vuelve al paso anterior» no aclara si se debe inspeccionar el equipo nuevo ni qué hacer si no hay reemplazo.
4. **Terminación:** el ciclo de cambio de artículos no tiene límite. Si se siguen encontrando desperfectos, el proceso podría no terminar.
5. **Inspección y seguridad:** «buenas condiciones» no define qué se revisa ni cuándo se considera seguro el equipo.
6. **Cierre del alquiler:** la primera versión termina cuando el cliente inicia el recorrido, sin indicar la devolución del equipo ni cerrar el proceso al regresar.

## Algoritmo corregido

**Inicio:** el cliente entra al local y se acerca a recepción.

1. El cliente solicita alquilar una bicicleta.
2. El personal comprueba si hay bicicletas disponibles:
   - Si no hay bicicletas, informa al cliente. **Fin:** el proceso termina sin alquiler ni pago.
   - Si hay bicicletas, continúa al paso 3.
3. El personal pregunta si el cliente desea una ruta guiada:
   - Si no la desea, continúa al paso 4 sin guía.
   - Si la desea y hay una ruta y un guía disponibles, informa el recorrido y su costo. El cliente decide si la acepta; si la acepta, se reserva, y si no, continúa sin guía.
   - Si la desea, pero no hay ruta o guía disponible, se lo informa y continúa sin guía.
4. El cliente completa el formulario de registro con sus datos personales.
5. El personal informa el costo total (incluida la ruta, si se reservó) y las formas de pago aceptadas. El cliente decide si acepta.
   - Si no acepta el costo o no puede pagar con una forma aceptada, **Fin:** el alquiler se cancela antes de entregar el equipo.
   - Si acepta, paga antes de recibir el equipo y continúa al paso 6.
6. El personal entrega una bicicleta, un casco y un candado. Se inicia un contador de bicicletas inspeccionadas con el valor 1.
7. El cliente comprueba que la bicicleta, el casco y el candado no tengan daños visibles y funcionen con normalidad.
   - Si los tres están en buen estado, continúa al paso 9.
   - Si alguno está dañado o no funciona, informa al personal y continúa al paso 8.
8. El personal recibe el equipo defectuoso:
   - Si ya se inspeccionaron tres bicicletas, o no hay una bicicleta de reemplazo disponible, cancela el alquiler y devuelve el pago. **Fin.**
   - Si se inspeccionaron menos de tres bicicletas y hay una bicicleta de reemplazo, entrega otra bicicleta con su casco y candado, aumenta el contador en 1 y vuelve al paso 7.
9. El cliente confirma que el equipo está en buen estado y sale del local con él. Realiza el recorrido reservado, si corresponde.
10. Al regresar, el cliente devuelve la bicicleta, el casco y el candado. **Fin:** el alquiler concluye.

**Garantía de finitud:** solo se vuelve del paso 8 al 7 cuando el contador aumenta. Como el contador empieza en 1 y no supera 3, el ciclo de inspección tiene un máximo de tres iteraciones. Las demás decisiones avanzan a un paso posterior o terminan.

## Características de un algoritmo

1. **Precisión:** el paso 8 indica la condición y la acción para ambos casos: «Si ya se inspeccionaron tres bicicletas, o no hay una bicicleta de reemplazo disponible, cancela el alquiler y devuelve el pago»; si hay reemplazo y el contador es menor que 3, entrega otro equipo y aumenta el contador.
2. **Finitud:** el paso 8 limita las inspecciones a tres bicicletas; por ejemplo, si la tercera también tiene un desperfecto, el alquiler se cancela y el proceso termina. En el caso exitoso, termina al devolver el equipo en el paso 10.
3. **Orden:** los pasos indican la secuencia; por ejemplo, el cliente acepta y paga el costo en el paso 5, recibe el equipo en el paso 6, lo inspecciona en el paso 7 y solo después sale del local en el paso 9.
4. **Determinismo:** con las mismas condiciones y la misma decisión del cliente, se sigue la misma rama. Por ejemplo, si no hay bicicletas disponibles en el paso 2, siempre se informa al cliente y termina sin alquiler ni pago.
5. **Efectividad:** las instrucciones son acciones concretas realizables. Por ejemplo, en el paso 7 el cliente revisa daños visibles y el funcionamiento de tres artículos; el personal puede comprobar si hay una bicicleta de reemplazo en el paso 8.

## Cuatro pilares del pensamiento computacional

1. **Descomposición:** separé el proceso en solicitud, disponibilidad, decisión sobre ruta guiada, registro, aceptación y pago, entrega e inspección, recorrido y devolución.
2. **Reconocimiento de patrones:** el flujo de registro, aceptación del costo y entrega se repite para cada cliente. También se repite la inspección del conjunto bicicleta-casco-candado cada vez que se entrega una bicicleta de reemplazo.
3. **Abstracción:** dejé fuera detalles que no cambian las decisiones del alquiler, como el color de la bicicleta, el nombre del empleado, el clima y el paisaje. Conservé la disponibilidad, la elección de ruta, el pago y el estado del equipo porque sí afectan el proceso.
4. **Diseño de algoritmos:** ordené las etapas y sus decisiones en los diez pasos corregidos; añadí salidas explícitas y un contador limitado a tres inspecciones para que el proceso termine.

## MiniReto 2: cotización básica

### Entrada, proceso y salida

| Entrada | Proceso | Salida |
|---|---|---|
| Nombre del cliente (`Caracter`) y horas de alquiler (`Entero`). | Multiplicar las horas por el precio fijo de $10.000 por hora. | Saludo con el nombre, las horas y el total a pagar. |

El algoritmo está implementado en [`01_cotizacion_basica.psc`](./algoritmos/01_cotizacion_basica.psc).

### Casos de prueba

| Nombre | Horas | Cálculo manual y salida esperada | Resultado obtenido |
|---|---:|---|---|
| Ana | 1 | 1 × $10.000 = **$10.000**; «Hola, Ana: tu alquiler de 1 horas cuesta $10000». | Coincide con el cálculo de escritorio. |
| Ana | 3 | 3 × $10.000 = **$30.000**; «Hola, Ana: tu alquiler de 3 horas cuesta $30000». | Coincide con el cálculo de escritorio. |
| Ana | 8 | 8 × $10.000 = **$80.000**; «Hola, Ana: tu alquiler de 8 horas cuesta $80000». | Coincide con el cálculo de escritorio. |

**Pendiente para la semana 2:** en esta versión, si se ingresan cero o una cantidad negativa de horas, el programa calcula y muestra un total cero o negativo. Aquí se describe el comportamiento sin agregar todavía una validación condicional.

## MiniReto 3: cotización de recorrido

### Entrada, proceso y salida

| Entrada | Proceso | Salida |
|---|---|---|
| Nombre del recorrido (`Caracter`), precio por persona (`Entero`) y cantidad de personas (`Entero`). | Total = precio × personas; anticipo = `Redon(total × 0.30)`; saldo = total − anticipo. | Nombre del recorrido, total, anticipo del 30 % y saldo pendiente. |

El algoritmo está implementado en [`02_cotizacion_recorrido.psc`](./algoritmos/02_cotizacion_recorrido.psc). Para **4 personas** en **Sabores de Barrio**, cuyo precio es $60.000 por persona:

| Instrucción | Variables después de la instrucción |
|---|---|
| Leer nombre | `nombreRecorrido = "Sabores de Barrio"` |
| Leer precio por persona | `precioPorPersona = 60000` |
| Leer cantidad | `cantidadPersonas = 4` |
| Calcular total | `total = 60000 × 4 = 240000` |
| Calcular anticipo | `anticipo = Redon(240000 × 0.30) = 72000` |
| Calcular saldo | `saldo = 240000 − 72000 = 168000` |

**Salida esperada y comprobada en la prueba de escritorio:** total **$240.000**, anticipo **$72.000** y saldo **$168.000**.

### Diagrama de flujo

El diagrama de [`02_cotizacion_recorrido.png`](./diagramas/02_cotizacion_recorrido.png) (con fuente vectorial [`02_cotizacion_recorrido.svg`](./diagramas/02_cotizacion_recorrido.svg)) representa el flujo del archivo `.psc`: inicio, lectura de datos, cálculos encadenados, presentación de resultados y fin. Sus símbolos son:

- **Inicio y fin:** óvalos.
- **Entrada y salida:** paralelogramos.
- **Proceso:** rectángulos para calcular el total, el anticipo y el saldo.

## MiniReto 4: cuenta del grupo (v0.1)

### Descomposición de cálculos

1. Calcular el alquiler: bicicletas × horas × $10.000 por hora.
2. Calcular el recorrido: precio por persona × cantidad de personas.
3. Sumar alquiler y recorrido para obtener el subtotal.
4. Calcular el aporte voluntario: subtotal × 10 / 100.
5. Sumar subtotal y aporte para obtener el total.
6. Dividir el total entre las personas y redondear el valor individual hacia arriba a la centena siguiente cuando no sea múltiplo exacto.

El algoritmo está implementado en [`03_cuenta_grupo.psc`](./algoritmos/03_cuenta_grupo.psc). Para valores monetarios enteros positivos, se usa esta fórmula:

```text
Trunc((total + cantidadPersonas × 100 − 1) / (cantidadPersonas × 100)) × 100
```

La fórmula aplica `Trunc` a la división entera equivalente a un techo: se suma el denominador menos uno antes de truncar. Así siempre se obtiene un múltiplo de 100 que es igual o mayor al valor exacto por persona, sin elevar importes que ya son múltiplos de 100.

### Casos de prueba

| Personas | Bicicletas × horas | Recorrido por persona | Alquiler | Recorrido | Subtotal | Aporte 10 % | Total | Exacto por persona | Redondeado |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 3 | 3 × 2 | $45.000 (Río y Parques) | $60.000 | $135.000 | $195.000 | $19.500 | $214.500 | $71.500 | **$71.500** |
| 4 | 3 × 3 | $60.000 (Sabores de Barrio) | $90.000 | $240.000 | $330.000 | $33.000 | $363.000 | $90.750 | **$90.800** |
| 3 | 2 × 2 | $45.000 (Río y Parques) | $40.000 | $135.000 | $175.000 | $17.500 | $192.500 | $64.166,67 | **$64.200** |

Los resultados de los tres casos coinciden con el cálculo manual de las operaciones del algoritmo. Se asume que las entradas son cantidades enteras positivas; el precio por persona igual a cero permite cotizar el alquiler sin recorrido. Validar datos vacíos, cantidades negativas y cero personas corresponde a retos posteriores.

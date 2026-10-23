# Bitácora: alquiler de una bicicleta

## Algoritmo

**Límite de revisión:** se revisan como máximo tres bicicletas y sus equipos. Si no se encuentra un conjunto seguro dentro de ese límite, el alquiler se cancela. Así, pedir un reemplazo nunca crea un ciclo infinito.

1. El cliente entra al local y se acerca a recepción.
2. El cliente solicita alquilar una bicicleta.
3. El personal comprueba la disponibilidad:
   - Si no hay bicicletas disponibles, informa al cliente y el proceso termina sin alquiler.
   - Si hay bicicletas disponibles, continúa al paso 4.
4. El personal pregunta si el cliente desea una ruta guiada:
   - Si no la desea, continúa al paso 6.
   - Si la desea y hay una ruta y un guía disponibles, informa el recorrido y su costo. El cliente decide si la acepta. Si la acepta, la reserva; si no, continúa sin guía.
   - Si la desea, pero no hay ruta o guía disponible, se lo informa y continúa sin guía.
5. El personal registra si el alquiler incluye guía o no.
6. El cliente completa el formulario de registro con sus datos personales.
7. El personal informa el costo total del alquiler —incluida la ruta guiada, si se reservó— y las formas de pago aceptadas. El pago se realiza antes de salir del local.
8. Si el cliente no acepta el costo o no puede pagar con una forma aceptada, el proceso termina sin entregar una bicicleta. Si acepta y paga, continúa.
9. El personal entrega una bicicleta, un casco y un candado. El contador de revisiones empieza en 1.
10. El cliente inspecciona la bicicleta, el casco y el candado:
    - Si los tres están en buen estado, continúa al paso 12.
    - Si alguno tiene un desperfecto, informa al personal y continúa al paso 11.
11. El personal recibe el equipo defectuoso:
    - Si ya se revisaron tres bicicletas, o no hay un reemplazo disponible, cancela el alquiler, devuelve al cliente el pago y el proceso termina.
    - Si el contador es menor que 3 y hay un reemplazo disponible, entrega otro equipo, aumenta el contador en 1 y vuelve al paso 10.
12. El cliente confirma que el equipo está en buen estado.
13. El cliente sale del local con la bicicleta, el casco y el candado y realiza el recorrido acordado, guiado o no.
14. Al regresar, el cliente devuelve la bicicleta, el casco y el candado. El proceso termina.

## Características de un algoritmo

- **Precisión:** cada instrucción indica quién actúa y qué debe hacer. Por ejemplo, el paso 11 especifica cuándo se cancela el alquiler y cuándo se entrega un reemplazo.
- **Finitud:** el proceso siempre termina. Si falta una bicicleta, no hay equipo seguro tras un máximo de tres revisiones o no se completa el pago, termina sin alquiler; si todo sale bien, termina cuando se devuelve el equipo.
- **Orden:** las acciones siguen una secuencia. Por ejemplo, se registra al cliente y se informa y paga el costo antes de entregar el equipo; el cliente inspecciona el equipo antes de salir.
- **Determinismo:** ante las mismas condiciones, se sigue la misma salida. Por ejemplo, si no hay bicicletas disponibles, siempre se informa al cliente y se termina sin alquiler.
- **Efectividad:** cada paso puede ejecutarse con acciones concretas y realizables. Por ejemplo, revisar el casco, comprobar si hay reemplazos y completar un formulario son tareas que el cliente o el personal pueden llevar a cabo.

## Cuatro pilares del pensamiento computacional

- **Descomposición:** dividí el alquiler en etapas pequeñas: solicitud, comprobación de disponibilidad, elección de ruta, registro, pago, entrega e inspección del equipo, recorrido y devolución.
- **Reconocimiento de patrones:** con cada cliente se repite el mismo flujo de registro, información del costo, entrega e inspección. La pregunta por la ruta guiada también se resuelve con las mismas opciones (disponible o no; aceptar o no).
- **Abstracción:** dejé fuera detalles que no cambian las decisiones del proceso, como el color de la bicicleta, el nombre del empleado, el clima o el paisaje del recorrido. Solo se consideran los datos necesarios para completar el alquiler de manera segura.
- **Diseño de algoritmos:** organicé las acciones y decisiones anteriores en los 14 pasos del algoritmo, con salidas claras y un límite de tres revisiones para asegurar que termine.

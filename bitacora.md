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

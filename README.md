# Rueda Libre: asistente de taquilla v0.1

Proyecto de algoritmia para el negocio de alquiler de bicicletas Rueda Libre. La bitácora registra el proceso de alquiler, sus ambigüedades, las decisiones corregidas y el análisis de sus características y pilares computacionales. También documenta los cálculos, las pruebas de escritorio y las pruebas de los tres primeros algoritmos de taquilla.

## Archivos

- [`bitacora.md`](./bitacora.md): algoritmo del alquiler en su versión inicial y corregida, análisis, tablas de entrada-proceso-salida y casos de prueba.
- [`algoritmos/01_cotizacion_basica.psc`](./algoritmos/01_cotizacion_basica.psc): alquiler urbano por horas.
- [`algoritmos/02_cotizacion_recorrido.psc`](./algoritmos/02_cotizacion_recorrido.psc): total, anticipo del 30 % y saldo de un recorrido.
- [`algoritmos/03_cuenta_grupo.psc`](./algoritmos/03_cuenta_grupo.psc): cuenta del grupo y redondeo del valor individual a la centena.
- [`diagramas/02_cotizacion_recorrido.png`](./diagramas/02_cotizacion_recorrido.png): diagrama de flujo del segundo algoritmo.

## Cómo abrir los algoritmos

1. Abre PSeInt.
2. Selecciona **Archivo > Abrir** y elige un archivo `.psc` de `algoritmos/`.
3. Ejecuta con **Ejecutar**. Los casos de prueba y sus resultados esperados están en la bitácora.

El primer algoritmo supone horas positivas; el registro de la entrada cero o negativa queda como pendiente de validación para la semana 2. El tercer algoritmo usa cantidades enteras positivas y precios por persona de la tabla de recorridos; se introduce `0` como precio cuando el grupo no reserva recorrido.
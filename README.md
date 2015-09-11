# Entorno Haskell

Esto es un breve y se4sgado resumen de la conferencia [https://www.youtube.com/watch?v=YU2i3L-euB0]

## Introducción
Haskell es un lenguaje de programación funcional y por tanto presenta múltiples
diferencias respecto de los lenguajes de programación en uso más frecuente en
la industria. No obstante, cada vez se incorporan más características
propias de la programación funcional en lenguajes como Java 8, por ejemplo:
- Funciones de más alto orden.
- Funciones lambda.
- Clausuras.
- Flujos para map-filter-reduce.
- Pereza (cálculo a demanda).
- Métodos por defecto en interfaces.
- El tipo optional (manejo de excepciones más robusto).

Entre las característiscas propias de la programación funcional más importantes
pueden citarse las siguientes restricciones:
- No puedes usar bucles.
- Todas las funciones tienen un único parámetro.
- Cada función consta de una sola expresión.
- No hay efectos secundarios (excepciones).
- Una vez se asigna un valor a un identificador, no se puede modificar.
- Las operaciones sobre estructuras de datos no son destructivas.
- El orden de ejecución no importa.
- Tipado estático.

## Fundamentos
En el origen de la programación funcional están el cálculo lambda y la teoría de
categorías.

## Instalación
La instalación por defecto de Haskell en los repositorios de una distribución
podría estar anticuada y resultar preferible descargar e instalar la versión
de la página web oficial [https://www.haskell.org/platform/#linux-generic].

Como IDE puede usarse los editores de texto frecuentes (Sublime Text, Atom,
emacs, vim) [https://wiki.haskell.org/IDEs]. También existe un IDE nativo
escrito en haskel con interfaz gtk llamado leksah y plugins para Eclipse e
IntelliJ.

Para evitar problemas de dependencias con cabal conviene iniciar una sandbox
que evite mezclar paquetes en diferentes proyectos. Para esto:
`
cabal sandbox init
`
Para iniciar un proyecto nuevo:
`
cabal init
`
Para instalar las dependencias que nos permitan hacer pruebas unitarias:
`
cabal install tasty tasty-hunit
`

Y para poder ejecutar las pruebas unitarias se debe modificar el fichero
PROYECTO.cabal con lo siguiente:
`
test-suite test
  type:                 exitcode-stdio-1.0
  hs-source-dirs:       test
  build-depends:        base
                      , tasty
                      , tasty-hunit
                      , FizzBuzz <-- LIBRERÍA A DEPURAR
  main-is:              Tests.hs
  default-language:     Haskell2010
`

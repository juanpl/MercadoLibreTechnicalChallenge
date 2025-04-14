# MercadoLibreTechnicalChallenge

Aplicación de ejemplo desarrollada en SwiftUI que consume la API de Mercado Libre developers para buscar productos, ver detalles y explorar características de los mismos.

## Características

- Búsqueda de productos por palabra clave.
- Listado de resultados con imágenes.
- Vista detallada del producto con galería de imágenes, atributos técnicos y más.
- Arquitectura basada en el patrón MVVM, estructurada bajo principios de Clean Architecture.
- Separación de capas en `Domain`, `Data` y `Presentation`.
- Consumo de APIs RESTful con `async/await`.

## Tecnologías

- SwiftUI
- Combine
- Clean Architecture
- Async/Await
- MVVM
- Git & GitHub

## 🔧 Requisitos técnicos

Este proyecto está construido con tecnologías modernas y requiere:

- **iOS:** 16.6 o superior
- **Swift:** 5.7 o superior
- **Xcode:** 14.0 o superior


## Instalación y uso

1. Clona el repositorio:
   ```bash
   git clone https://github.com/juanpl/MercadoLibreTechnicalChallenge.git

2. Para el correcto funcionamiento de la App debe introducir el token de seguridad, para hacerlo debe ir a la carpeta MercadoLibreTechnicalChallenge/Core/Constants/ConstantsValues y cambiar el valor de la variable 'tokenKey' por el valor de su tocken de seguridad.

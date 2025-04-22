# Refactorización de CRUD de Aprendices con Buenas Prácticas

Este proyecto consiste en la refactorización de una aplicación CRUD (Crear, Leer, Actualizar, Eliminar) para la gestión de aprendices. El objetivo principal es aplicar buenas prácticas de desarrollo utilizando PHP, Programación Orientada a Objetos (POO), PDO para una conexión segura a la base de datos MySQL y el patrón de arquitectura MVC (Modelo-Vista-Controlador).

Este proyecto se basa en el repositorio original: [https://github.com/jhonhader2/CRUD_APRENDICES](https://github.com/jhonhader2/CRUD_APRENDICES).

## Objetivo

Refactorizar la aplicación CRUD de aprendices existente, implementando las siguientes buenas prácticas y tecnologías:

* **PHP:** Utilización de la última versión recomendada de PHP.
* **Programación Orientada a Objetos (POO):** Estructuración del código mediante clases, objetos, herencia, encapsulamiento y polimorfismo.
* **PDO (PHP Data Objects):** Implementación para una conexión segura y eficiente a la base de datos MySQL, previniendo inyecciones SQL.
* **Patrón de Arquitectura MVC:** Separación clara de la lógica de negocio (Modelo), la presentación de datos (Vista) y el manejo de las interacciones del usuario (Controlador).
* **MySQL:** Utilización de una base de datos MySQL para el almacenamiento de la información de los aprendices.
* **Modelo Entidad Relación (MER):** Diseño y documentación de la estructura de la base de datos mediante un Modelo Entidad Relación.
* **Validaciones del lado del servidor:** Implementación de validaciones robustas en el backend para asegurar la integridad de los datos antes de su almacenamiento.

## Funcionalidades

La aplicación refactorizada permite registrar y gestionar la información de los aprendices, incluyendo los siguientes campos obligatorios:

* Tipo de documento
* Número de documento
* Nombres
* Apellidos
* Sexo
* Grupo sanguíneo y factor RH
* Nombre del programa de formación
* Número de ficha

## Bonus (Puntos Adicionales)

Se han implementado las siguientes mejoras opcionales:

* **SweetAlert2:** Utilización de la librería JavaScript SweetAlert2 para mostrar notificaciones atractivas y personalizadas al usuario.
* **FontAwesome:** Incorporación de la librería de iconos FontAwesome para mejorar la interfaz gráfica con iconos relevantes.
* **Bootstrap:** Aplicación de estilos CSS con el framework Bootstrap para crear una interfaz de usuario responsive y visualmente agradable.

## Modelo Entidad Relación (MER)
![image](https://github.com/user-attachments/assets/d4f58f4e-d64a-49cd-9148-ebc9dfcc7730)

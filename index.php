<?php
require_once 'controllers/controller_usuarios.php';

$controller = new UsuarioController();
$controller->listar(); // Llama a la función que muestra productos

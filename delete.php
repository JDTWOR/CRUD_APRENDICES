<?php
require_once  'views/index.php';

$id = $_GET['id'];
$resultado = $usuarios_model->eliminar_usuario($id);
if ($resultado) {
    echo "<script>alert('Registro eliminado correctamente');</script>";
    echo "<script>window.location.href='index.php';</script>";
} else {
    echo "<script>alert('Error al eliminar el registro');</script>";
    echo "<script>window.location.href='index.php';</script>";
}

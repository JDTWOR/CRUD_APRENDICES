<?php
include 'database/conexion.php';
class Usuario {
    public $conexion;

    public function __construct(){
        $this->conexion = Conexion::conectar();
    }
    public function crear_usuario($nombre) {
        $sql = "INSERT INTO usuarios (nombre) VALUES (:nombre)";
        $stmt = $this->conexion->prepare($sql);
        $stmt->bindParam(':nombre', $nombre);
        return $stmt->execute();
    }
    public function obtener_usuarios() {
        $sql = "SELECT * FROM usuarios";
        $stmt = $this->conexion->query($sql);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function editar_usuario($id, $nombre) {
        $sql = "ALTER TABLE usuarios WHERE $";
        $stmt = $this->conexion->query($sql);
        $stmt->bindParam(':nombre', $nombre);
        return $stmt->execute();
    }
    public function eliminar_usuario($id) {
        $sql = "SELECT * FROM usuarios";
        $stmt = $this->conexion->query($sql);
        return $stmt->execute();
    }
}

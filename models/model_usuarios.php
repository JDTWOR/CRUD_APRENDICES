<?php
require_once 'database/db.php';
class Usuario {
    private PDO $conn;

    public function __construct(){

        $this->conn = (new Conexion())->conectar();

    }
    public function crear_usuario($nombre) {
        $sql = "INSERT INTO usuarios (nombre) VALUES (:nombre)";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':nombre', $nombre);
        return $stmt->execute();
    }
    public function obtener_usuarios() {
        $sql = "SELECT * FROM usuarios";
        $stmt = $this->conn->query($sql);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function obtener_usuario($id) {
        $sql = "SELECT * FROM usuarios WHERE id = $id";
        $stmt = $this->conn->query($sql);
        return $stmt->fetch();
    }
    public function editar_usuario($id, $nombre) {
        $sql = "ALTER TABLE usuarios WHERE $id";
        $stmt = $this->conn->query($sql);
        $stmt->bindParam(':nombre', $nombre);
        return $stmt->execute();
    }
    public function eliminar_usuario($id) {
        $sql = "DELETE FROM usuarios WHERE id=$id";
        $stmt = $this->conn->query($sql);
        return $stmt->execute();
    }
}

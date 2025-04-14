<?php
class Conexion{
    private string $host = 'localhost';
    private string $db = 'db_aprendices';
    private string $user = 'root';
    private string $pass = '';
    private PDO $conexion;

    public function conectar(): PDO
    {
        try { 
            $this->conexion = new PDO("mysql:host=$this->host;dbname=$this->db", $this->user, $this->pass);
            $this->conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $this->conexion;
        } catch (PDOException $e) {
            die("Error de conexión: " . $e->getMessage());
        }
    }
}

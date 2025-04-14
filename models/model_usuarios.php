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
        $sql = "SELECT
                    a.id,
                    CONCAT_WS(' ', 
                        p.primer_nombre, 
                        IFNULL(p.segundo_nombre, ''), 
                        p.primer_apellido, 
                        IFNULL(p.segundo_apellido, '')
                    ) AS nombre_completo,
                    p.fecha_nacimiento
                FROM 
                    aprendiz a
                JOIN 
                    persona p ON a.id_persona = p.id
                ORDER BY 
                    p.primer_apellido, p.primer_nombre;";
        $stmt = $this->conn->query($sql);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function obtener_aprendiz($id) {
        $sql = "SELECT 
                    a.id,
                    p.*,
                    a.fecha_ingreso,
                    a.estado AS estado_aprendiz,
                    td.nombre AS tipo_documento,
                    s.nombre AS sexo,
                    CONCAT(ts.grupo, ts.factor) AS tipo_sangre,
                    GROUP_CONCAT(DISTINCT CONCAT(pf.nombre, ' (Ficha: ', f.numero, ')') SEPARATOR ', ') AS programas,
                    GROUP_CONCAT(DISTINCT f.numero) AS fichas
                FROM 
                    aprendiz a
                JOIN 
                    persona p ON a.id_persona = p.id
                JOIN 
                    tipo_documento td ON p.id_tipo_documento = td.id
                JOIN 
                    sexo s ON p.id_sexo = s.id
                JOIN 
                    tipo_sangre ts ON p.id_tipo_sangre = ts.id
                LEFT JOIN 
                    aprendiz_ficha af ON a.id = af.id_aprendiz
                LEFT JOIN 
                    ficha f ON af.id_ficha = f.id
                LEFT JOIN 
                    programa_formacion pf ON f.id_programa_formacion = pf.id
                WHERE 
                    a.id = :id
                GROUP BY 
                    a.id";
        
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        
        return $stmt->fetch(PDO::FETCH_ASSOC);
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

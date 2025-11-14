<?php
include 'db.php';

// Obtener el nombre de la liga pasada por GET
$nombre_liga = isset($_GET['nombre_liga']) ? $_GET['nombre_liga'] : '';

if (empty($nombre_liga)) {
    echo json_encode(["error" => "Debe especificar el nombre de la liga."]);
    exit;
}

// Escapar la cadena para evitar inyección SQL
$nombre_liga = $conn->real_escape_string($nombre_liga);

$sql = "SELECT 
            nombre_equipo,
            nombre_estadio,
            anio_fundacion,
            nombre_liga
        FROM Equipos
        WHERE nombre_liga = '$nombre_liga'
        ORDER BY nombre_equipo";

$result = $conn->query($sql);
$clubes = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $clubes[] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode($clubes);
?>

<?php
include 'db.php';

$nombre_equipo = isset($_GET['nombre_equipo']) ? $_GET['nombre_equipo'] : '';

if (empty($nombre_equipo)) {
    echo json_encode(["error" => "Debe especificar el nombre del equipo."]);
    exit;
}

$nombre_equipo = $conn->real_escape_string($nombre_equipo);

$sql = "SELECT 
            dni_jugador,
            nombre_jugador,
            apellido_jugador,
            posicion_jugador,
            valor_jugador,
            estado_jugador,
            interes_jugador,
            nacionalidad,
            sueldo_por_mes,
            nombre_equipo
        FROM Jugadores
        WHERE nombre_equipo = '$nombre_equipo'
        ORDER BY valor_jugador DESC";

$result = $conn->query($sql);
$jugadores = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $jugadores[] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode($jugadores);
?>

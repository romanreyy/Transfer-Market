<?php
include 'db.php';

$sql = "SELECT 
            dni_agente,
            nombre_agente,
            apellido_agente,
            nacimiento_agente,
            comision_por_mes
        FROM Agentes
        ORDER BY apellido_agente";

$result = $conn->query($sql);
$agentes = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $agentes[] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode($agentes);
?>

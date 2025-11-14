<?php
include 'db.php';

$sql = "SELECT 
            c.id_contrato,
            c.duracion,
            c.clausula,
            c.plata_por_mes,
            c.tipo_contrato,
            a.nombre_agente,
            a.apellido_agente
        FROM Contratos c
        LEFT JOIN Agentes a ON c.dni_agente = a.dni_agente
        ORDER BY c.id_contrato";

$result = $conn->query($sql);
$contratos = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $contratos[] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode($contratos);
?>

<?php
include 'db.php';

$sql = "SELECT 
            t.equipo_proviene,
            t.equipo_transferido,
            t.monto_transferencia,
            t.fecha,
            j.nombre_jugador,
            j.apellido_jugador,
            c.tipo_contrato
        FROM Transferencias t
        LEFT JOIN Jugadores j ON t.dni_jugador = j.dni_jugador
        LEFT JOIN Contratos c ON t.id_contrato = c.id_contrato
        ORDER BY t.fecha DESC
        LIMIT 20";

$result = $conn->query($sql);
$transferencias = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $transferencias[] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode($transferencias);
?>

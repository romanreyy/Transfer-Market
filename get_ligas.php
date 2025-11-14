<?php
include 'db.php';

// Consulta directa según tu estructura
$sql = "SELECT nombre_liga, pais, division, nombre_asociacion FROM Ligas ORDER BY nombre_liga";

$result = $conn->query($sql);
$ligas = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $ligas[] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode($ligas);
?>

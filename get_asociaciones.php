<?php
include 'db.php';

$sql = "SELECT 
            nombre_asociacion,
            continente_abarca
        FROM Asociaciones
        ORDER BY nombre_asociacion";

$result = $conn->query($sql);
$asociaciones = [];

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $asociaciones[] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode($asociaciones);
?>

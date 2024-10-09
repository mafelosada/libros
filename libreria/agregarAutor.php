<?php
include 'baseDatos.php'; // Asegúrate de que la ruta sea correcta

// Obtener los datos del autor desde la solicitud
$data = json_decode(file_get_contents("php://input"), true);
$nombre = $data['nombre'];
$biografia = $data['biografia'];

// Insertar el nuevo autor en la base de datos
$sql = "INSERT INTO Autor (nombre, biografia) VALUES (?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $nombre, $biografia);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false, 'error' => $stmt->error]);
}

$stmt->close();
$conn->close();
?>

<?php
include 'baseDatos.php'; // Asegúrate de que la ruta sea correcta

$id = $_GET['id']; // Obtener el ID del autor a eliminar

// Eliminar el autor de la base de datos
$sql = "DELETE FROM Autor WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false, 'error' => $stmt->error]);
}

$stmt->close();
$conn->close();
?>

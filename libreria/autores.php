<?php
include 'baseDatos.php'; // Asegúrate de que la ruta sea correcta

// Consulta para seleccionar todos los autores y sus libros
$sql = "SELECT A.id, A.nombre, A.biografia,  GROUP_CONCAT(L.nombre SEPARATOR ', ') AS libro
        FROM Autor A
        LEFT JOIN LibroAutor LA ON A.id = LA.autor
        LEFT JOIN Libro L ON LA.libro = L.id
        GROUP BY A.id";

$result = $conn->query($sql);

$autores = array(); // Crear un array para almacenar los resultados

if ($result->num_rows > 0) {
    // Almacenar los resultados en el array
    while ($row = $result->fetch_assoc()) {
        $autores[] = $row; // Añadir cada fila al array
    }
}

// Establecer el encabezado para la respuesta JSON
header('Content-Type: application/json');

// Convertir el array a JSON y mostrarlo
echo json_encode($autores);

$conn->close();
?>



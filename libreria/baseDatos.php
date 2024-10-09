<?php
$servername = "localhost"; // Cambia esto si tu servidor de base de datos es diferente
$username = "root";   // Reemplaza con tu nombre de usuario de MySQL
$password = ""; // Reemplaza con tu contraseña de MySQL
$dbname = "libros";         // Nombre de tu base de datos

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Comprobar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>




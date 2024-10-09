// Función para cargar los autores desde la API
function cargarAutores() {
    fetch('libreria/autores.php') // Ruta al archivo PHP
        .then(response => {
            if (!response.ok) {
                throw new Error('Error al cargar los datos');
            }
            return response.json();
        })
        .then(data => {
            mostrarAutores(data);
        })
        .catch(error => {
            console.error('Error:', error);
        });
}
function mostrarAutores(autores) {
    const tbody = document.querySelector('#tabla-usuarios tbody');
    tbody.innerHTML = ''; // Limpiar el contenido anterior

    autores.forEach((autor, index) => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
            <td>${index + 1}</td>
            <td>${autor.nombre}</td>
            <td>${autor.biografia}</td>
            <td>
                <button onclick="eliminarAutor(${autor.id})">Eliminar</button>
            </td>
        `;
        tbody.appendChild(tr);
    });
}


// Función para agregar un nuevo autor
document.getElementById('form-agregar').addEventListener('submit', function (e) {
    e.preventDefault(); // Prevenir el comportamiento por defecto del formulario

    const nombre = document.getElementById('nombre').value;
    const biografia = document.getElementById('biografia').value;

    fetch('libreria/agregarAutor.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ nombre, biografia }),
    })
        .then(response => response.json())
        .then(data => {
            // Recargar los autores después de agregar
            cargarAutores();
            // Limpiar el formulario
            document.getElementById('form-agregar').reset();
        })
        .catch(error => {
            console.error('Error:', error);
        });
});

// Función para eliminar un autor
function eliminarAutor(id) {
    fetch(`libreria/eliminarAutor.php?id=${id}`, {
        method: 'DELETE',
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Error al eliminar el autor');
            }
            // Recargar los autores después de eliminar
            cargarAutores();
        })
        .catch(error => {
            console.error('Error:', error);
        });
}

// Cargar los autores al cargar la página
window.onload = cargarAutores;




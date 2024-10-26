<?php
require_once 'app/DatabaseService.php'; 
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listado de Propiedades</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Estilos para intercalar el color de fondo de las filas */
        tbody tr:nth-child(odd) {
            background-color: #f8f9fa;
        }
        .small-font-table {
            font-size: 0.9rem; /* Tamaño de fuente ligeramente más pequeño */
        }
    </style>
</head>
<body>

<!-- Header -->
<header class="bg-secondary text-white text-center py-4">
    <h1>Listado de Propiedades</h1>
</header>

<!-- Body con la Tabla -->
<div class="container my-4">
    <table class="table table-bordered table-hover small-font-table">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Título</th>
                <th>Precio</th>
                <th>Dormitorios</th>
                <th>Huéspedes</th>
                <th>Baños</th>
                <th>Barrio/Localidad</th>
                <th>Plataforma</th>
                <th>Link</th>
            </tr>
        </thead>
        <tbody>
            <?php
            // Get properties
            $databaseService = new DatabaseService('localhost', 'idatos', 'root', 'secret');
            $properties = $databaseService->getProperties();
            foreach ($properties as $property) {
                ?>
                    <tr>
                        <td><?= $property['id'] ?></td>
                        <td><?= $property['title'] ?></td>
                        <td><?= $property['currency'] ?> <?= $property['price'] ?></td>
                        <td><?= $property['bedrooms'] ?></td>
                        <td><?= $property['guests'] ?></td>
                        <td><?= $property['bathrooms'] ?></td>
                        <td><?= $property['neighborhood'] ?>, <?= $property['location'] ?></td>
                        <td><?= $property['platform'] ?></td>
                        <td><a href=<?= $property['url'] ?> target="_blank">Ver más</a></td>
                    </tr>
            <?php
            } 
            ?>
            
            <!-- Agregar más filas según sea necesario -->
        </tbody>
    </table>
</div>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-3">
    <p>&copy; 2024 Listado de Propiedades. Todos los derechos reservados.</p>
</footer>

<!-- Bootstrap JS y jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

<?php

// Función para manejar las rutas
function route($path) {
    switch ($path) {
        case '/':
            require __DIR__ . '/index.php';
            break;
        case '/propiedades':
            require __DIR__ . '/properties.php';
            break;
        case '/propiedad':
            require __DIR__ . '/property.php';
            break;
        case '/contacto':
            require __DIR__ . '/contact.php';
            break;
        case '/login':
            require __DIR__ . '/login.php';
            break;
        default:
            // Página 404 si la ruta no existe
            http_response_code(404);
            require __DIR__ . '/404.php';
            break;
    }
}

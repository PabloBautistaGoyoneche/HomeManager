<?php
// index.php

// Define el nombre del subdirectorio donde está tu proyecto
$baseFolder = '/HomeManager/';  // Asegúrate de que coincida con el nombre de tu carpeta

// Obtiene la URL actual y elimina el subdirectorio
$url = str_replace($baseFolder, '', parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));
$url = trim($url, '/'); // Elimina las barras al principio y al final

// Depuración: Muestra el valor de $url
// var_dump($url);

// Define tus rutas
$routes = [
    '' => 'public/home.php',
    'propiedades' => 'public/properties.php',
    'propiedad' => 'public/property.php',
    'contacto' => 'public/contact.php',
    'login' => 'public/login.php',
    // Agrega más rutas según necesites
];

// Depuración: Muestra el array de rutas
// var_dump($routes);

// Verifica si la ruta existe en el array
if (array_key_exists($url, $routes)) {
    include $routes[$url];
} else {
    // Maneja la ruta no encontrada
    include 'public/404.php';
}
?>

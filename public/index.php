<?php

// Incluir el archivo de enrutamiento
require_once 'router.php';

// Obtener la ruta actual
$requestUri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

// Llamar a la función de enrutamiento
route($requestUri);

?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Manager</title>
</head>

<body>

    <?php echo "Bienvenido a HomeManager!";?>

</body>

</html>
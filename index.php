<?php

require_once 'app/ScraperFactory.php';
require_once 'app/DatabaseService.php';

// Verificar si la URL fue pasada como parámetro
if (isset($_SERVER['argv'][1])) {
    $url = $_SERVER['argv'][1];
} else {
    echo "Error: Debes pasar una URL como parámetro.\n";
    exit(1);
}

try {  
    // Crear el scraper adecuado
    $scraper = ScraperFactory::createScraper($url);
    
    // Scraper los datos
    $data = $scraper->scrape($url);

    // Guardar los datos en la base de datos
    $databaseService = new DatabaseService('localhost', 'idatos', 'root', 'secret');
    $databaseService->saveToDatabase($data);

    echo "Datos scrapeados y guardados exitosamente.";
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}

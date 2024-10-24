<?php

require_once 'app/ScraperFactory.php';
require_once 'app/DatabaseService.php';

// Url parameter
if (isset($_SERVER['argv'][1])) {
    $url = $_SERVER['argv'][1];
} else {
    echo "Error: Debes pasar una URL como parámetro.\n";
    exit(1);
}

try {  
    // Create scraper
    $scraper = ScraperFactory::createScraper($url);
    
    // Scrapping data
    $data = $scraper->scrape($url);

    // Save to Database
    $databaseService = new DatabaseService('localhost', 'idatos', 'root', 'secret');
    $databaseService->saveProperty($data);

    echo "Datos scrapeados y guardados exitosamente.";
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}

<?php

require_once 'InfoCasasScraper.php';
require_once 'MercadoLibreScraper.php';

class ScraperFactory
{
    public static function createScraper($url)
    {
        if (strpos($url, 'infocasas.com.uy') !== false) {
            return new InfoCasasScraper();
        } elseif (strpos($url, 'mercadolibre.com.uy') !== false) {
            return new MercadoLibreScraper();
        } else {
            throw new Exception("No scraper available for this URL");
        }
    }
}
?>
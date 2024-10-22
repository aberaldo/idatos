<?php

require_once 'InfoCasasScraper.php';
require_once 'MercadoLibreScraper.php';

class ScraperFactory
{
    public static function createScraper($url)
    {
        if (strpos($url, 'infocasas.com.uy') !== false) {
            //https://www.infocasas.com.uy/alquiler-temporal/casas-y-apartamentos/maldonado/punta-del-este?&fechaDesde=2025/01/01&fechaHasta=2025/01/31
            return new InfoCasasScraper();
        } elseif (strpos($url, 'mercadolibre.com.uy') !== false) {
            //https://listado.mercadolibre.com.uy/alquiler-temporario-punta-del-este_noindex_true\#applied_filter_id%3Dneighborhood%26applied_filter_name%3DBarrios%26applied_filter_order%3D6%26applied_value_id%3DTVhYUGxheWEgTWFuc2FUVXhWUTFCYVdtRmhOR%26applied_value_name%3DPlaya+Mansa%26applied_value_order%3D10%26applied_value_results%3D5236%26is_custom%3Dfalse
            return new MercadoLibreScraper();
        } else {
            throw new Exception("No scraper available for this URL");
        }
    }
}
?>
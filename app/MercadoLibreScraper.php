<?php
require_once 'ScraperServiceInterface.php';

class MercadoLibreScraper implements ScraperServiceInterface
{
    public function getWebContent($url)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3');
        $html = curl_exec($ch);
        curl_close($ch);

        return $html;
    }

    public function scrapeData($html)
    {
        $dom = new DOMDocument();
        @$dom->loadHTML($html);  // Cargar el HTML en el DOMDocument
        $xpath = new DOMXPath($dom);

        // Extraer las propiedades utilizando XPath
        $propertyItems = $xpath->query("//li[contains(@class, 'ui-search-layout__item')]");
        var_dump($propertyItems->item(0));
        die;
        $properties = [];
        foreach ($propertyItems as $item) {
            
            //Title
            $urlNode = $xpath->query(".//h2[contains(@class, 'poly-component__title')]", $item);
            $title = $urlNode->item(0)->textContent;
           // $url = $urlNode->item(0)->getAttribute('href');
//var_dump($urlNode);
var_dump($urlNode->item(1));
die;
            //Price
            $priceNode = $xpath->query(".//div[contains(@class, 'lc-price')]", $item);
            $price = trim($priceNode->item(0)->nodeValue);
            
            $price = explode(" ",$price);
            $priceValue = null;
            $currencyValue = null;

            if (count($price) == 2) {
                $priceValue = $price[0];
                $currencyValue = $price[1];
            }

            //Bedrooms
            $bedroomsNode = $xpath->query(".//div[contains(@class, 'lc-typologyTag')]//strong", $item);
            $bedrooms = $bedroomsNode->item(0)->nodeValue;
            $bedrooms = explode(" ",$bedrooms);

            //Baths
            $bathsNode = $xpath->query(".//div[contains(@class, 'lc-typologyTag')]//strong", $item);
            $baths = $bathsNode->item(1)->nodeValue;
            $baths = explode(" ",$baths);
            
            //Guests
            $guestsNode = $xpath->query(".//div[contains(@class, 'lc-typologyTag')]//strong", $item);
            $guests = $guestsNode->item(2)->nodeValue;
            $guests = explode(" ",$guests);

            //Location
            $locationNode = $xpath->query(".//strong[contains(@class, 'lc-location')]", $item);
            $location = $locationNode->item(0)->nodeValue;
            $location = explode(",",$location);
            
            $propertyData = [
                'title' => $title,
                'price' => $priceValue,
                'currency' => $currencyValue,
                'bedrooms' => (int)$bedrooms[0],
                'bathrooms' => (int)$baths[0],
                'guests' =>  (int)$guests[0],
                'neighborhood' =>  $location[0],
                'location' => $location[1],
                'url' => "https://www.infocasas.com.uy".$url,
            ];
            $propertyData['hash'] = md5(json_encode($propertyData));

            $properties[] = $propertyData;
        }

        return $properties;
    }

    public function scrape($url)
    {
        // Obtener el contenido HTML de la web
        $html = $this->getWebContent($url);

        // Scrapeo de datos
        return $this->scrapeData($html);
    }
}

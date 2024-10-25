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
        $propertyItems = $xpath->query("//div[contains(@class, 'poly-card__content')]");
        $properties = [];
        foreach ($propertyItems as $item) {
            
            //Title
            $urlNode = $xpath->query(".//h2[contains(@class, 'poly-component__title')]", $item);
            $title = $urlNode->item(0)->textContent;

            //Url
            $urlNode = $xpath->query(".//h2[contains(@class, 'poly-component__title')]//a", $item);
            $urlData = $urlNode->item(0)->getAttribute('href');
            $urlData = explode("&tracking_id", $urlData); //viene un dato track_id en la url que cada vez que se lee la url cambia. Eso daba problemas con el hash. Se saca ese track_id
            $url=$urlData[0];
            
            //Price
            $priceNode = $xpath->query(".//span[contains(@class, 'andes-money-amount__fraction')]", $item);
            $price = $priceNode->item(0)->textContent * 1000; //Se multiplica por 1000 debido al formato

            $currencyNode = $xpath->query(".//span[contains(@class, 'andes-money-amount__currency-symbol')]", $item);
            $currency = $currencyNode->item(0)->textContent;

            if ($currency == "US$") { //La moneda se transforma a USD y UYU
                $currency = "USD";
            } else {
                $currency = "UYU";
            }

            $attributesNode = $xpath->query(".//li[contains(@class, 'poly-attributes-list__item')]", $item);
            
            //Bedrooms
            $bedroomsNode = $attributesNode->item(0)->nodeValue;
            $bedrooms = explode(" ",$bedroomsNode); //El formato es X dormitorios. Nos quedamos con el numero

            //Baths
            $bathNode = $attributesNode->item(1)->nodeValue;
            $baths = explode(" ",$bathNode); //El formato es X baños. Nos quedamos solo con el numero
            
            //Guests
            /*$guestsNode = $xpath->query(".//div[contains(@class, 'lc-typologyTag')]//strong", $item);
            $guests = $guestsNode->item(2)->nodeValue;
            $guests = explode(" ",$guests);*/

            //Location
            $locationNode = $xpath->query(".//span[contains(@class, 'poly-component__location')]", $item);
            $locationItem = $locationNode->item(0)->nodeValue;
            $location = explode(",",$locationItem); //El formato es un listado de lugares y el ultimo es la localidad. Nos quedamos con el primero y el ultimo
            
            $cantLocation = count($location);
           
            $neighborhood = trim($location[0]); //El primero es el barrio
            $location = trim($location[$cantLocation-1]); //El ultimo es el localidad

            $propertyData = [
                'title' => $title,
                'price' => $price,
                'currency' => $currency,
                'bedrooms' => (int)$bedrooms[0],
                'bathrooms' => (int)$baths[0],
                'guests' =>  0,
                'neighborhood' =>  $neighborhood,
                'location' => $location,
                'url' => $url,
                'platform' => 'mercado-libre',
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

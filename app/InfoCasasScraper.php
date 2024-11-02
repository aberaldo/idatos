<?php
require_once 'ScraperServiceInterface.php';

class InfoCasasScraper implements ScraperServiceInterface
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
        $propertyItems = $xpath->query("//div[contains(@class, 'listingCard')]");

        $properties = [];
        foreach ($propertyItems as $item) {
            
            //Title
            $urlNode = $xpath->query(".//a", $item);
            $title = $urlNode->item(0)->getAttribute('title');
            $url = $urlNode->item(0)->getAttribute('href');

            //Price
            $priceNode = $xpath->query(".//div[contains(@class, 'lc-price')]", $item);
            $price = trim($priceNode->item(0)->nodeValue);
            
            $price = explode(" ",$price); //El formato del precio es Moneda Precio
            $priceValue = null;
            $currencyValue = null;

            if (count($price) == 2) {
                $currencyValue = $price[0]; //Moneda
                $priceValue = $price[1]; //Precio
            }

            if ($currencyValue == 'U$S') { //La moneda se transforma a USD y UYU
                $currency = 'USD';
            } else {
                $currency = 'UYU';
            }

            //Bedrooms
            $bedroomsNode = $xpath->query(".//div[contains(@class, 'lc-typologyTag')]//strong", $item);
            $bedrooms = $bedroomsNode->item(0)->nodeValue;
            $bedrooms = explode(" ",$bedrooms); //El formato es X dormitorios. Nos quedamos con el numero

            //Baths
            $bathsNode = $xpath->query(".//div[contains(@class, 'lc-typologyTag')]//strong", $item);
            $baths = $bathsNode->item(1)->nodeValue;
            $baths = explode(" ",$baths); //El formato es X baños. Nos quedamos con el numero
            
            //Guests
            $guestsNode = $xpath->query(".//div[contains(@class, 'lc-typologyTag')]//strong", $item);
            $guests = $guestsNode->item(2)->nodeValue;
            $guests = explode(" ",$guests); //El formato es X huespedes. Nos quedamos con el numero

            //Location
            $locationNode = $xpath->query(".//strong[contains(@class, 'lc-location')]", $item);
            $location = $locationNode->item(0)->nodeValue;
            $location = explode(",",$location); //La localidad es barrio, localidad. 
            
            $neighborhood = trim($location[0]); //Barrio
            $location = trim($location[1]); //Localidad
            
            if (!is_null($title) && !is_null($location)) { //Completitud, se exige titulo y localidad
                $propertyData = [
                    'title' => $title,
                    'price' => $priceValue,
                    'currency' => $currency,
                    'bedrooms' => (int)$bedrooms[0],
                    'bathrooms' => (int)$baths[0],
                    'guests' =>  (int)$guests[0],
                    'neighborhood' =>  $neighborhood,
                    'location' => $location,
                ];

                //Frescura de datos, generacion de hash
                $propertyData['hash'] = md5(json_encode($propertyData));

                $propertyData['url'] = "https://www.infocasas.com.uy".$url;
                $propertyData['platform'] = 'info-casas';
                $properties[] = $propertyData;
            }
            
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

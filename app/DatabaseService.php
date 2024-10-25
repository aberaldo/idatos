<?php

class DatabaseService
{
    private $pdo;

    public function __construct($host, $dbname, $username, $password)
    {
        // Conectar a la base de datos
        $dsn = "mysql:host=$host;dbname=$dbname;charset=utf8mb4";
        $this->pdo = new PDO($dsn, $username, $password);
        $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }

    public function saveProperty($data)
    {
    
        foreach ($data as $property) {
            //Get or create location
            $locationId = $this->getOrCreateLocation($property['location']);
            $neighborhoodId = $this->getOrCreateNeighborhood($property['neighborhood']);

            $this->insertOrUpdateProperty($property, $locationId, $neighborhoodId);
            
        }
    }

    function insertOrUpdateProperty($property, $locationId, $neighborhoodId) {

        $query = "SELECT * FROM properties WHERE url = :url";
        $stmt = $this->pdo->prepare($query);
        $stmt->execute(['url' => $property['url']]);

        $query = null;
        if ($stmt->rowCount() > 0) {
            $prop = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($prop['hash'] != $property['hash']) {
                // Update
                var_dump("entroooo");
                $query = "UPDATE properties SET title = :title, price = :price, currency = :currency,  bedrooms = :bedrooms, guests = :guests, bathrooms = :bathrooms, neighborhood = :neighborhood, location = :location, url = :url, platform = :platform, hash = :hash WHERE url = :url";
            }
        } else {
            // Insert
            $query = "INSERT INTO properties (title, price, currency, bedrooms, guests, bathrooms, neighborhood, location, url, platform, hash) VALUES (:title, :price, :currency, :bedrooms, :guests, :bathrooms, :neighborhood, :location, :url, :platform, :hash) ON DUPLICATE KEY UPDATE hash = VALUES(hash)";
        }

        if ($query) {
            // Execute query
            $stmt = $this->pdo->prepare($query);
            $stmt->execute([
                ':title' => $property['title'],
                ':price' => $property['price'],
                ':currency' => $property['currency'],
                ':bedrooms' => $property['bedrooms'],
                ':guests' => $property['guests'],
                ':bathrooms' => $property['bathrooms'],
                ':neighborhood' => $neighborhoodId,
                ':location' => $locationId,
                ':url' => $property['url'],
                ':platform' => $property['platform'],
                ':hash' => $property['hash'],
            ]);
        }   
        
    }
    
    function getOrCreateLocation($location) {
        try {
            // Try insert location
            $sql = "INSERT INTO locations (name) VALUES (:name)
                    ON DUPLICATE KEY UPDATE id=LAST_INSERT_ID(id)";
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([':name' => $location]);
            
            return $this->pdo->lastInsertId();
        } catch (PDOException $e) {
            echo "Error al insertar o actualizar localidad: " . $e->getMessage();
        }
    }
    
    function getOrCreateNeighborhood($neighborhood) {
        try {
            // Try insert location
            $sql = "INSERT INTO neighborhoods (name) VALUES (:name)
                    ON DUPLICATE KEY UPDATE id=LAST_INSERT_ID(id)";
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute([':name' => $neighborhood]);
            
            return $this->pdo->lastInsertId();
        } catch (PDOException $e) {
            echo "Error al insertar o actualizar barrio: " . $e->getMessage();
        }
    }
}

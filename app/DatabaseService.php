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

            // Save to database
            $stmt = $this->pdo->prepare("INSERT INTO properties (title, price, currency, bedrooms, guests, bathrooms, neighborhood, location, url, hash) VALUES (:title, :price, :currency, :bedrooms, :guests, :bathrooms, :neighborhood, :location, :url, :hash) ON DUPLICATE KEY UPDATE hash = VALUES(hash)");

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

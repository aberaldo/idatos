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

    public function saveToDatabase($data)
    {
    
        foreach ($data as $property) {
            // Guardar cada propiedad en la base de datos
            $stmt = $this->pdo->prepare("INSERT INTO properties (title, price, currency, bedrooms, guests, bathrooms, neighborhood, location, url, hash) VALUES (:title, :price, :currency, :bedrooms, :guests, :bathrooms, :neighborhood, :location, :url, :hash) ON DUPLICATE KEY UPDATE hash = VALUES(hash)");

            $stmt->execute([
                ':title' => $property['title'],
                ':price' => $property['price'],
                ':currency' => $property['currency'],
                ':bedrooms' => $property['bedrooms'],
                ':guests' => $property['guests'],
                ':bathrooms' => $property['bathrooms'],
                ':neighborhood' => $property['neighborhood'],
                ':location' => $property['location'],
                ':url' => $property['url'],
                ':hash' => $property['hash'],
            ]);
        }
    }
}
